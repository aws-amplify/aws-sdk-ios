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

#import "AWSAlexaforbusinessService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAlexaforbusinessResources.h"

static NSString *const AWSInfoAlexaforbusiness = @"Alexaforbusiness";
NSString *const AWSAlexaforbusinessSDKVersion = @"2.13.4";


@interface AWSAlexaforbusinessResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSAlexaforbusinessResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlreadyExistsException" : @(AWSAlexaforbusinessErrorAlreadyExists),
                            @"ConcurrentModificationException" : @(AWSAlexaforbusinessErrorConcurrentModification),
                            @"DeviceNotRegisteredException" : @(AWSAlexaforbusinessErrorDeviceNotRegistered),
                            @"InvalidCertificateAuthorityException" : @(AWSAlexaforbusinessErrorInvalidCertificateAuthority),
                            @"InvalidDeviceException" : @(AWSAlexaforbusinessErrorInvalidDevice),
                            @"InvalidSecretsManagerResourceException" : @(AWSAlexaforbusinessErrorInvalidSecretsManagerResource),
                            @"InvalidServiceLinkedRoleStateException" : @(AWSAlexaforbusinessErrorInvalidServiceLinkedRoleState),
                            @"InvalidUserStatusException" : @(AWSAlexaforbusinessErrorInvalidUserStatus),
                            @"LimitExceededException" : @(AWSAlexaforbusinessErrorLimitExceeded),
                            @"NameInUseException" : @(AWSAlexaforbusinessErrorNameInUse),
                            @"NotFoundException" : @(AWSAlexaforbusinessErrorNotFound),
                            @"ResourceAssociatedException" : @(AWSAlexaforbusinessErrorResourceAssociated),
                            @"ResourceInUseException" : @(AWSAlexaforbusinessErrorResourceInUse),
                            @"SkillNotLinkedException" : @(AWSAlexaforbusinessErrorSkillNotLinked),
                            @"UnauthorizedException" : @(AWSAlexaforbusinessErrorUnauthorized),
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
    	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
	        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSAlexaforbusinessErrorDomain
	                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
	                                             code:AWSCognitoIdentityErrorUnknown
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        }
    	}
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSAlexaforbusinessErrorDomain
                                     code:AWSAlexaforbusinessErrorUnknown
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

@interface AWSAlexaforbusinessRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAlexaforbusinessRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAlexaforbusiness()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAlexaforbusiness

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAlexaforbusinessSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAlexaforbusiness versions need to match. Check your SDK installation. AWSCore: %@ AWSAlexaforbusiness: %@", AWSiOSSDKVersion, AWSAlexaforbusinessSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAlexaforbusiness {
    static AWSAlexaforbusiness *_defaultAlexaforbusiness = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAlexaforbusiness];
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
        _defaultAlexaforbusiness = [[AWSAlexaforbusiness alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAlexaforbusiness;
}

+ (void)registerAlexaforbusinessWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAlexaforbusiness alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AlexaforbusinessForKey:(NSString *)key {
    @synchronized(self) {
        AWSAlexaforbusiness *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAlexaforbusiness
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAlexaforbusinessForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAlexaforbusiness` or `+ AlexaforbusinessForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAlexaforbusiness
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAlexaforbusiness];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAlexaforbusinessRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

		NSMutableDictionary *headers = [NSMutableDictionary new];
        headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
        networkingRequest.headers = headers;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSAlexaforbusinessResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAlexaforbusinessResponseSerializer alloc] initWithJSONDefinition:[[AWSAlexaforbusinessResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSAlexaforbusinessApproveSkillResponse *> *)approveSkill:(AWSAlexaforbusinessApproveSkillRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ApproveSkill"
                   outputClass:[AWSAlexaforbusinessApproveSkillResponse class]];
}

- (void)approveSkill:(AWSAlexaforbusinessApproveSkillRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessApproveSkillResponse *response, NSError *error))completionHandler {
    [[self approveSkill:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessApproveSkillResponse *> * _Nonnull task) {
        AWSAlexaforbusinessApproveSkillResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessAssociateContactWithAddressBookResponse *> *)associateContactWithAddressBook:(AWSAlexaforbusinessAssociateContactWithAddressBookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"AssociateContactWithAddressBook"
                   outputClass:[AWSAlexaforbusinessAssociateContactWithAddressBookResponse class]];
}

- (void)associateContactWithAddressBook:(AWSAlexaforbusinessAssociateContactWithAddressBookRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessAssociateContactWithAddressBookResponse *response, NSError *error))completionHandler {
    [[self associateContactWithAddressBook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessAssociateContactWithAddressBookResponse *> * _Nonnull task) {
        AWSAlexaforbusinessAssociateContactWithAddressBookResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse *> *)associateDeviceWithNetworkProfile:(AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"AssociateDeviceWithNetworkProfile"
                   outputClass:[AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse class]];
}

- (void)associateDeviceWithNetworkProfile:(AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse *response, NSError *error))completionHandler {
    [[self associateDeviceWithNetworkProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse *> * _Nonnull task) {
        AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessAssociateDeviceWithRoomResponse *> *)associateDeviceWithRoom:(AWSAlexaforbusinessAssociateDeviceWithRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"AssociateDeviceWithRoom"
                   outputClass:[AWSAlexaforbusinessAssociateDeviceWithRoomResponse class]];
}

- (void)associateDeviceWithRoom:(AWSAlexaforbusinessAssociateDeviceWithRoomRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessAssociateDeviceWithRoomResponse *response, NSError *error))completionHandler {
    [[self associateDeviceWithRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessAssociateDeviceWithRoomResponse *> * _Nonnull task) {
        AWSAlexaforbusinessAssociateDeviceWithRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse *> *)associateSkillGroupWithRoom:(AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"AssociateSkillGroupWithRoom"
                   outputClass:[AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse class]];
}

- (void)associateSkillGroupWithRoom:(AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse *response, NSError *error))completionHandler {
    [[self associateSkillGroupWithRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse *> * _Nonnull task) {
        AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse *> *)associateSkillWithSkillGroup:(AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"AssociateSkillWithSkillGroup"
                   outputClass:[AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse class]];
}

- (void)associateSkillWithSkillGroup:(AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse *response, NSError *error))completionHandler {
    [[self associateSkillWithSkillGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessAssociateSkillWithUsersResponse *> *)associateSkillWithUsers:(AWSAlexaforbusinessAssociateSkillWithUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"AssociateSkillWithUsers"
                   outputClass:[AWSAlexaforbusinessAssociateSkillWithUsersResponse class]];
}

- (void)associateSkillWithUsers:(AWSAlexaforbusinessAssociateSkillWithUsersRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessAssociateSkillWithUsersResponse *response, NSError *error))completionHandler {
    [[self associateSkillWithUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessAssociateSkillWithUsersResponse *> * _Nonnull task) {
        AWSAlexaforbusinessAssociateSkillWithUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateAddressBookResponse *> *)createAddressBook:(AWSAlexaforbusinessCreateAddressBookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateAddressBook"
                   outputClass:[AWSAlexaforbusinessCreateAddressBookResponse class]];
}

- (void)createAddressBook:(AWSAlexaforbusinessCreateAddressBookRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateAddressBookResponse *response, NSError *error))completionHandler {
    [[self createAddressBook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateAddressBookResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateAddressBookResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateBusinessReportScheduleResponse *> *)createBusinessReportSchedule:(AWSAlexaforbusinessCreateBusinessReportScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateBusinessReportSchedule"
                   outputClass:[AWSAlexaforbusinessCreateBusinessReportScheduleResponse class]];
}

- (void)createBusinessReportSchedule:(AWSAlexaforbusinessCreateBusinessReportScheduleRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateBusinessReportScheduleResponse *response, NSError *error))completionHandler {
    [[self createBusinessReportSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateBusinessReportScheduleResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateBusinessReportScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateConferenceProviderResponse *> *)createConferenceProvider:(AWSAlexaforbusinessCreateConferenceProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateConferenceProvider"
                   outputClass:[AWSAlexaforbusinessCreateConferenceProviderResponse class]];
}

- (void)createConferenceProvider:(AWSAlexaforbusinessCreateConferenceProviderRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateConferenceProviderResponse *response, NSError *error))completionHandler {
    [[self createConferenceProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateConferenceProviderResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateConferenceProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateContactResponse *> *)createContact:(AWSAlexaforbusinessCreateContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateContact"
                   outputClass:[AWSAlexaforbusinessCreateContactResponse class]];
}

- (void)createContact:(AWSAlexaforbusinessCreateContactRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateContactResponse *response, NSError *error))completionHandler {
    [[self createContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateContactResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateGatewayGroupResponse *> *)createGatewayGroup:(AWSAlexaforbusinessCreateGatewayGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateGatewayGroup"
                   outputClass:[AWSAlexaforbusinessCreateGatewayGroupResponse class]];
}

- (void)createGatewayGroup:(AWSAlexaforbusinessCreateGatewayGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateGatewayGroupResponse *response, NSError *error))completionHandler {
    [[self createGatewayGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateGatewayGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateGatewayGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateNetworkProfileResponse *> *)createNetworkProfile:(AWSAlexaforbusinessCreateNetworkProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateNetworkProfile"
                   outputClass:[AWSAlexaforbusinessCreateNetworkProfileResponse class]];
}

- (void)createNetworkProfile:(AWSAlexaforbusinessCreateNetworkProfileRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateNetworkProfileResponse *response, NSError *error))completionHandler {
    [[self createNetworkProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateNetworkProfileResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateNetworkProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateProfileResponse *> *)createProfile:(AWSAlexaforbusinessCreateProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateProfile"
                   outputClass:[AWSAlexaforbusinessCreateProfileResponse class]];
}

- (void)createProfile:(AWSAlexaforbusinessCreateProfileRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateProfileResponse *response, NSError *error))completionHandler {
    [[self createProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateProfileResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateRoomResponse *> *)createRoom:(AWSAlexaforbusinessCreateRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateRoom"
                   outputClass:[AWSAlexaforbusinessCreateRoomResponse class]];
}

- (void)createRoom:(AWSAlexaforbusinessCreateRoomRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateRoomResponse *response, NSError *error))completionHandler {
    [[self createRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateRoomResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateSkillGroupResponse *> *)createSkillGroup:(AWSAlexaforbusinessCreateSkillGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateSkillGroup"
                   outputClass:[AWSAlexaforbusinessCreateSkillGroupResponse class]];
}

- (void)createSkillGroup:(AWSAlexaforbusinessCreateSkillGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateSkillGroupResponse *response, NSError *error))completionHandler {
    [[self createSkillGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateSkillGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateSkillGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessCreateUserResponse *> *)createUser:(AWSAlexaforbusinessCreateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"CreateUser"
                   outputClass:[AWSAlexaforbusinessCreateUserResponse class]];
}

- (void)createUser:(AWSAlexaforbusinessCreateUserRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessCreateUserResponse *response, NSError *error))completionHandler {
    [[self createUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessCreateUserResponse *> * _Nonnull task) {
        AWSAlexaforbusinessCreateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteAddressBookResponse *> *)deleteAddressBook:(AWSAlexaforbusinessDeleteAddressBookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteAddressBook"
                   outputClass:[AWSAlexaforbusinessDeleteAddressBookResponse class]];
}

- (void)deleteAddressBook:(AWSAlexaforbusinessDeleteAddressBookRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteAddressBookResponse *response, NSError *error))completionHandler {
    [[self deleteAddressBook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteAddressBookResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteAddressBookResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteBusinessReportScheduleResponse *> *)deleteBusinessReportSchedule:(AWSAlexaforbusinessDeleteBusinessReportScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteBusinessReportSchedule"
                   outputClass:[AWSAlexaforbusinessDeleteBusinessReportScheduleResponse class]];
}

- (void)deleteBusinessReportSchedule:(AWSAlexaforbusinessDeleteBusinessReportScheduleRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteBusinessReportScheduleResponse *response, NSError *error))completionHandler {
    [[self deleteBusinessReportSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteBusinessReportScheduleResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteBusinessReportScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteConferenceProviderResponse *> *)deleteConferenceProvider:(AWSAlexaforbusinessDeleteConferenceProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteConferenceProvider"
                   outputClass:[AWSAlexaforbusinessDeleteConferenceProviderResponse class]];
}

- (void)deleteConferenceProvider:(AWSAlexaforbusinessDeleteConferenceProviderRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteConferenceProviderResponse *response, NSError *error))completionHandler {
    [[self deleteConferenceProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteConferenceProviderResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteConferenceProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteContactResponse *> *)deleteContact:(AWSAlexaforbusinessDeleteContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteContact"
                   outputClass:[AWSAlexaforbusinessDeleteContactResponse class]];
}

- (void)deleteContact:(AWSAlexaforbusinessDeleteContactRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteContactResponse *response, NSError *error))completionHandler {
    [[self deleteContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteContactResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteDeviceResponse *> *)deleteDevice:(AWSAlexaforbusinessDeleteDeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteDevice"
                   outputClass:[AWSAlexaforbusinessDeleteDeviceResponse class]];
}

- (void)deleteDevice:(AWSAlexaforbusinessDeleteDeviceRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteDeviceResponse *response, NSError *error))completionHandler {
    [[self deleteDevice:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteDeviceResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteDeviceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteDeviceUsageDataResponse *> *)deleteDeviceUsageData:(AWSAlexaforbusinessDeleteDeviceUsageDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteDeviceUsageData"
                   outputClass:[AWSAlexaforbusinessDeleteDeviceUsageDataResponse class]];
}

- (void)deleteDeviceUsageData:(AWSAlexaforbusinessDeleteDeviceUsageDataRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteDeviceUsageDataResponse *response, NSError *error))completionHandler {
    [[self deleteDeviceUsageData:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteDeviceUsageDataResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteDeviceUsageDataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteGatewayGroupResponse *> *)deleteGatewayGroup:(AWSAlexaforbusinessDeleteGatewayGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteGatewayGroup"
                   outputClass:[AWSAlexaforbusinessDeleteGatewayGroupResponse class]];
}

- (void)deleteGatewayGroup:(AWSAlexaforbusinessDeleteGatewayGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteGatewayGroupResponse *response, NSError *error))completionHandler {
    [[self deleteGatewayGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteGatewayGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteGatewayGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteNetworkProfileResponse *> *)deleteNetworkProfile:(AWSAlexaforbusinessDeleteNetworkProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteNetworkProfile"
                   outputClass:[AWSAlexaforbusinessDeleteNetworkProfileResponse class]];
}

- (void)deleteNetworkProfile:(AWSAlexaforbusinessDeleteNetworkProfileRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteNetworkProfileResponse *response, NSError *error))completionHandler {
    [[self deleteNetworkProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteNetworkProfileResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteNetworkProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteProfileResponse *> *)deleteProfile:(AWSAlexaforbusinessDeleteProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteProfile"
                   outputClass:[AWSAlexaforbusinessDeleteProfileResponse class]];
}

- (void)deleteProfile:(AWSAlexaforbusinessDeleteProfileRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteProfileResponse *response, NSError *error))completionHandler {
    [[self deleteProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteProfileResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteRoomResponse *> *)deleteRoom:(AWSAlexaforbusinessDeleteRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteRoom"
                   outputClass:[AWSAlexaforbusinessDeleteRoomResponse class]];
}

- (void)deleteRoom:(AWSAlexaforbusinessDeleteRoomRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteRoomResponse *response, NSError *error))completionHandler {
    [[self deleteRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteRoomResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteRoomSkillParameterResponse *> *)deleteRoomSkillParameter:(AWSAlexaforbusinessDeleteRoomSkillParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteRoomSkillParameter"
                   outputClass:[AWSAlexaforbusinessDeleteRoomSkillParameterResponse class]];
}

- (void)deleteRoomSkillParameter:(AWSAlexaforbusinessDeleteRoomSkillParameterRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteRoomSkillParameterResponse *response, NSError *error))completionHandler {
    [[self deleteRoomSkillParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteRoomSkillParameterResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteRoomSkillParameterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteSkillAuthorizationResponse *> *)deleteSkillAuthorization:(AWSAlexaforbusinessDeleteSkillAuthorizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteSkillAuthorization"
                   outputClass:[AWSAlexaforbusinessDeleteSkillAuthorizationResponse class]];
}

- (void)deleteSkillAuthorization:(AWSAlexaforbusinessDeleteSkillAuthorizationRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteSkillAuthorizationResponse *response, NSError *error))completionHandler {
    [[self deleteSkillAuthorization:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteSkillAuthorizationResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteSkillAuthorizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteSkillGroupResponse *> *)deleteSkillGroup:(AWSAlexaforbusinessDeleteSkillGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteSkillGroup"
                   outputClass:[AWSAlexaforbusinessDeleteSkillGroupResponse class]];
}

- (void)deleteSkillGroup:(AWSAlexaforbusinessDeleteSkillGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteSkillGroupResponse *response, NSError *error))completionHandler {
    [[self deleteSkillGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteSkillGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteSkillGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDeleteUserResponse *> *)deleteUser:(AWSAlexaforbusinessDeleteUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DeleteUser"
                   outputClass:[AWSAlexaforbusinessDeleteUserResponse class]];
}

- (void)deleteUser:(AWSAlexaforbusinessDeleteUserRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDeleteUserResponse *response, NSError *error))completionHandler {
    [[self deleteUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDeleteUserResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDeleteUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDisassociateContactFromAddressBookResponse *> *)disassociateContactFromAddressBook:(AWSAlexaforbusinessDisassociateContactFromAddressBookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DisassociateContactFromAddressBook"
                   outputClass:[AWSAlexaforbusinessDisassociateContactFromAddressBookResponse class]];
}

- (void)disassociateContactFromAddressBook:(AWSAlexaforbusinessDisassociateContactFromAddressBookRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDisassociateContactFromAddressBookResponse *response, NSError *error))completionHandler {
    [[self disassociateContactFromAddressBook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDisassociateContactFromAddressBookResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDisassociateContactFromAddressBookResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDisassociateDeviceFromRoomResponse *> *)disassociateDeviceFromRoom:(AWSAlexaforbusinessDisassociateDeviceFromRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DisassociateDeviceFromRoom"
                   outputClass:[AWSAlexaforbusinessDisassociateDeviceFromRoomResponse class]];
}

- (void)disassociateDeviceFromRoom:(AWSAlexaforbusinessDisassociateDeviceFromRoomRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDisassociateDeviceFromRoomResponse *response, NSError *error))completionHandler {
    [[self disassociateDeviceFromRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDisassociateDeviceFromRoomResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDisassociateDeviceFromRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse *> *)disassociateSkillFromSkillGroup:(AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DisassociateSkillFromSkillGroup"
                   outputClass:[AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse class]];
}

- (void)disassociateSkillFromSkillGroup:(AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse *response, NSError *error))completionHandler {
    [[self disassociateSkillFromSkillGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDisassociateSkillFromUsersResponse *> *)disassociateSkillFromUsers:(AWSAlexaforbusinessDisassociateSkillFromUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DisassociateSkillFromUsers"
                   outputClass:[AWSAlexaforbusinessDisassociateSkillFromUsersResponse class]];
}

- (void)disassociateSkillFromUsers:(AWSAlexaforbusinessDisassociateSkillFromUsersRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDisassociateSkillFromUsersResponse *response, NSError *error))completionHandler {
    [[self disassociateSkillFromUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDisassociateSkillFromUsersResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDisassociateSkillFromUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse *> *)disassociateSkillGroupFromRoom:(AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"DisassociateSkillGroupFromRoom"
                   outputClass:[AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse class]];
}

- (void)disassociateSkillGroupFromRoom:(AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse *response, NSError *error))completionHandler {
    [[self disassociateSkillGroupFromRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse *> * _Nonnull task) {
        AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessForgetSmartHomeAppliancesResponse *> *)forgetSmartHomeAppliances:(AWSAlexaforbusinessForgetSmartHomeAppliancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ForgetSmartHomeAppliances"
                   outputClass:[AWSAlexaforbusinessForgetSmartHomeAppliancesResponse class]];
}

- (void)forgetSmartHomeAppliances:(AWSAlexaforbusinessForgetSmartHomeAppliancesRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessForgetSmartHomeAppliancesResponse *response, NSError *error))completionHandler {
    [[self forgetSmartHomeAppliances:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessForgetSmartHomeAppliancesResponse *> * _Nonnull task) {
        AWSAlexaforbusinessForgetSmartHomeAppliancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetAddressBookResponse *> *)getAddressBook:(AWSAlexaforbusinessGetAddressBookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetAddressBook"
                   outputClass:[AWSAlexaforbusinessGetAddressBookResponse class]];
}

- (void)getAddressBook:(AWSAlexaforbusinessGetAddressBookRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetAddressBookResponse *response, NSError *error))completionHandler {
    [[self getAddressBook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetAddressBookResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetAddressBookResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetConferencePreferenceResponse *> *)getConferencePreference:(AWSAlexaforbusinessGetConferencePreferenceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetConferencePreference"
                   outputClass:[AWSAlexaforbusinessGetConferencePreferenceResponse class]];
}

- (void)getConferencePreference:(AWSAlexaforbusinessGetConferencePreferenceRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetConferencePreferenceResponse *response, NSError *error))completionHandler {
    [[self getConferencePreference:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetConferencePreferenceResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetConferencePreferenceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetConferenceProviderResponse *> *)getConferenceProvider:(AWSAlexaforbusinessGetConferenceProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetConferenceProvider"
                   outputClass:[AWSAlexaforbusinessGetConferenceProviderResponse class]];
}

- (void)getConferenceProvider:(AWSAlexaforbusinessGetConferenceProviderRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetConferenceProviderResponse *response, NSError *error))completionHandler {
    [[self getConferenceProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetConferenceProviderResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetConferenceProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetContactResponse *> *)getContact:(AWSAlexaforbusinessGetContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetContact"
                   outputClass:[AWSAlexaforbusinessGetContactResponse class]];
}

- (void)getContact:(AWSAlexaforbusinessGetContactRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetContactResponse *response, NSError *error))completionHandler {
    [[self getContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetContactResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetDeviceResponse *> *)getDevice:(AWSAlexaforbusinessGetDeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetDevice"
                   outputClass:[AWSAlexaforbusinessGetDeviceResponse class]];
}

- (void)getDevice:(AWSAlexaforbusinessGetDeviceRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetDeviceResponse *response, NSError *error))completionHandler {
    [[self getDevice:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetDeviceResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetDeviceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetGatewayResponse *> *)getGateway:(AWSAlexaforbusinessGetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetGateway"
                   outputClass:[AWSAlexaforbusinessGetGatewayResponse class]];
}

- (void)getGateway:(AWSAlexaforbusinessGetGatewayRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetGatewayResponse *response, NSError *error))completionHandler {
    [[self getGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetGatewayResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetGatewayResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetGatewayGroupResponse *> *)getGatewayGroup:(AWSAlexaforbusinessGetGatewayGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetGatewayGroup"
                   outputClass:[AWSAlexaforbusinessGetGatewayGroupResponse class]];
}

- (void)getGatewayGroup:(AWSAlexaforbusinessGetGatewayGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetGatewayGroupResponse *response, NSError *error))completionHandler {
    [[self getGatewayGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetGatewayGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetGatewayGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetInvitationConfigurationResponse *> *)getInvitationConfiguration:(AWSAlexaforbusinessGetInvitationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetInvitationConfiguration"
                   outputClass:[AWSAlexaforbusinessGetInvitationConfigurationResponse class]];
}

- (void)getInvitationConfiguration:(AWSAlexaforbusinessGetInvitationConfigurationRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetInvitationConfigurationResponse *response, NSError *error))completionHandler {
    [[self getInvitationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetInvitationConfigurationResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetInvitationConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetNetworkProfileResponse *> *)getNetworkProfile:(AWSAlexaforbusinessGetNetworkProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetNetworkProfile"
                   outputClass:[AWSAlexaforbusinessGetNetworkProfileResponse class]];
}

- (void)getNetworkProfile:(AWSAlexaforbusinessGetNetworkProfileRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetNetworkProfileResponse *response, NSError *error))completionHandler {
    [[self getNetworkProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetNetworkProfileResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetNetworkProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetProfileResponse *> *)getProfile:(AWSAlexaforbusinessGetProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetProfile"
                   outputClass:[AWSAlexaforbusinessGetProfileResponse class]];
}

- (void)getProfile:(AWSAlexaforbusinessGetProfileRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetProfileResponse *response, NSError *error))completionHandler {
    [[self getProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetProfileResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetRoomResponse *> *)getRoom:(AWSAlexaforbusinessGetRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetRoom"
                   outputClass:[AWSAlexaforbusinessGetRoomResponse class]];
}

- (void)getRoom:(AWSAlexaforbusinessGetRoomRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetRoomResponse *response, NSError *error))completionHandler {
    [[self getRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetRoomResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetRoomSkillParameterResponse *> *)getRoomSkillParameter:(AWSAlexaforbusinessGetRoomSkillParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetRoomSkillParameter"
                   outputClass:[AWSAlexaforbusinessGetRoomSkillParameterResponse class]];
}

- (void)getRoomSkillParameter:(AWSAlexaforbusinessGetRoomSkillParameterRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetRoomSkillParameterResponse *response, NSError *error))completionHandler {
    [[self getRoomSkillParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetRoomSkillParameterResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetRoomSkillParameterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessGetSkillGroupResponse *> *)getSkillGroup:(AWSAlexaforbusinessGetSkillGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"GetSkillGroup"
                   outputClass:[AWSAlexaforbusinessGetSkillGroupResponse class]];
}

- (void)getSkillGroup:(AWSAlexaforbusinessGetSkillGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessGetSkillGroupResponse *response, NSError *error))completionHandler {
    [[self getSkillGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessGetSkillGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessGetSkillGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListBusinessReportSchedulesResponse *> *)listBusinessReportSchedules:(AWSAlexaforbusinessListBusinessReportSchedulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListBusinessReportSchedules"
                   outputClass:[AWSAlexaforbusinessListBusinessReportSchedulesResponse class]];
}

- (void)listBusinessReportSchedules:(AWSAlexaforbusinessListBusinessReportSchedulesRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListBusinessReportSchedulesResponse *response, NSError *error))completionHandler {
    [[self listBusinessReportSchedules:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListBusinessReportSchedulesResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListBusinessReportSchedulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListConferenceProvidersResponse *> *)listConferenceProviders:(AWSAlexaforbusinessListConferenceProvidersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListConferenceProviders"
                   outputClass:[AWSAlexaforbusinessListConferenceProvidersResponse class]];
}

- (void)listConferenceProviders:(AWSAlexaforbusinessListConferenceProvidersRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListConferenceProvidersResponse *response, NSError *error))completionHandler {
    [[self listConferenceProviders:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListConferenceProvidersResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListConferenceProvidersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListDeviceEventsResponse *> *)listDeviceEvents:(AWSAlexaforbusinessListDeviceEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListDeviceEvents"
                   outputClass:[AWSAlexaforbusinessListDeviceEventsResponse class]];
}

- (void)listDeviceEvents:(AWSAlexaforbusinessListDeviceEventsRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListDeviceEventsResponse *response, NSError *error))completionHandler {
    [[self listDeviceEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListDeviceEventsResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListDeviceEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListGatewayGroupsResponse *> *)listGatewayGroups:(AWSAlexaforbusinessListGatewayGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListGatewayGroups"
                   outputClass:[AWSAlexaforbusinessListGatewayGroupsResponse class]];
}

- (void)listGatewayGroups:(AWSAlexaforbusinessListGatewayGroupsRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListGatewayGroupsResponse *response, NSError *error))completionHandler {
    [[self listGatewayGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListGatewayGroupsResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListGatewayGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListGatewaysResponse *> *)listGateways:(AWSAlexaforbusinessListGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListGateways"
                   outputClass:[AWSAlexaforbusinessListGatewaysResponse class]];
}

- (void)listGateways:(AWSAlexaforbusinessListGatewaysRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListGatewaysResponse *response, NSError *error))completionHandler {
    [[self listGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListGatewaysResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListGatewaysResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListSkillsResponse *> *)listSkills:(AWSAlexaforbusinessListSkillsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListSkills"
                   outputClass:[AWSAlexaforbusinessListSkillsResponse class]];
}

- (void)listSkills:(AWSAlexaforbusinessListSkillsRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListSkillsResponse *response, NSError *error))completionHandler {
    [[self listSkills:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListSkillsResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListSkillsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListSkillsStoreCategoriesResponse *> *)listSkillsStoreCategories:(AWSAlexaforbusinessListSkillsStoreCategoriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListSkillsStoreCategories"
                   outputClass:[AWSAlexaforbusinessListSkillsStoreCategoriesResponse class]];
}

- (void)listSkillsStoreCategories:(AWSAlexaforbusinessListSkillsStoreCategoriesRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListSkillsStoreCategoriesResponse *response, NSError *error))completionHandler {
    [[self listSkillsStoreCategories:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListSkillsStoreCategoriesResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListSkillsStoreCategoriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse *> *)listSkillsStoreSkillsByCategory:(AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListSkillsStoreSkillsByCategory"
                   outputClass:[AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse class]];
}

- (void)listSkillsStoreSkillsByCategory:(AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse *response, NSError *error))completionHandler {
    [[self listSkillsStoreSkillsByCategory:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListSmartHomeAppliancesResponse *> *)listSmartHomeAppliances:(AWSAlexaforbusinessListSmartHomeAppliancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListSmartHomeAppliances"
                   outputClass:[AWSAlexaforbusinessListSmartHomeAppliancesResponse class]];
}

- (void)listSmartHomeAppliances:(AWSAlexaforbusinessListSmartHomeAppliancesRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListSmartHomeAppliancesResponse *response, NSError *error))completionHandler {
    [[self listSmartHomeAppliances:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListSmartHomeAppliancesResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListSmartHomeAppliancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessListTagsResponse *> *)listTags:(AWSAlexaforbusinessListTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ListTags"
                   outputClass:[AWSAlexaforbusinessListTagsResponse class]];
}

- (void)listTags:(AWSAlexaforbusinessListTagsRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessListTagsResponse *response, NSError *error))completionHandler {
    [[self listTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessListTagsResponse *> * _Nonnull task) {
        AWSAlexaforbusinessListTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessPutConferencePreferenceResponse *> *)putConferencePreference:(AWSAlexaforbusinessPutConferencePreferenceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"PutConferencePreference"
                   outputClass:[AWSAlexaforbusinessPutConferencePreferenceResponse class]];
}

- (void)putConferencePreference:(AWSAlexaforbusinessPutConferencePreferenceRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessPutConferencePreferenceResponse *response, NSError *error))completionHandler {
    [[self putConferencePreference:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessPutConferencePreferenceResponse *> * _Nonnull task) {
        AWSAlexaforbusinessPutConferencePreferenceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessPutInvitationConfigurationResponse *> *)putInvitationConfiguration:(AWSAlexaforbusinessPutInvitationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"PutInvitationConfiguration"
                   outputClass:[AWSAlexaforbusinessPutInvitationConfigurationResponse class]];
}

- (void)putInvitationConfiguration:(AWSAlexaforbusinessPutInvitationConfigurationRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessPutInvitationConfigurationResponse *response, NSError *error))completionHandler {
    [[self putInvitationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessPutInvitationConfigurationResponse *> * _Nonnull task) {
        AWSAlexaforbusinessPutInvitationConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessPutRoomSkillParameterResponse *> *)putRoomSkillParameter:(AWSAlexaforbusinessPutRoomSkillParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"PutRoomSkillParameter"
                   outputClass:[AWSAlexaforbusinessPutRoomSkillParameterResponse class]];
}

- (void)putRoomSkillParameter:(AWSAlexaforbusinessPutRoomSkillParameterRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessPutRoomSkillParameterResponse *response, NSError *error))completionHandler {
    [[self putRoomSkillParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessPutRoomSkillParameterResponse *> * _Nonnull task) {
        AWSAlexaforbusinessPutRoomSkillParameterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessPutSkillAuthorizationResponse *> *)putSkillAuthorization:(AWSAlexaforbusinessPutSkillAuthorizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"PutSkillAuthorization"
                   outputClass:[AWSAlexaforbusinessPutSkillAuthorizationResponse class]];
}

- (void)putSkillAuthorization:(AWSAlexaforbusinessPutSkillAuthorizationRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessPutSkillAuthorizationResponse *response, NSError *error))completionHandler {
    [[self putSkillAuthorization:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessPutSkillAuthorizationResponse *> * _Nonnull task) {
        AWSAlexaforbusinessPutSkillAuthorizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessRegisterAVSDeviceResponse *> *)registerAVSDevice:(AWSAlexaforbusinessRegisterAVSDeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"RegisterAVSDevice"
                   outputClass:[AWSAlexaforbusinessRegisterAVSDeviceResponse class]];
}

- (void)registerAVSDevice:(AWSAlexaforbusinessRegisterAVSDeviceRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessRegisterAVSDeviceResponse *response, NSError *error))completionHandler {
    [[self registerAVSDevice:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessRegisterAVSDeviceResponse *> * _Nonnull task) {
        AWSAlexaforbusinessRegisterAVSDeviceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessRejectSkillResponse *> *)rejectSkill:(AWSAlexaforbusinessRejectSkillRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"RejectSkill"
                   outputClass:[AWSAlexaforbusinessRejectSkillResponse class]];
}

- (void)rejectSkill:(AWSAlexaforbusinessRejectSkillRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessRejectSkillResponse *response, NSError *error))completionHandler {
    [[self rejectSkill:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessRejectSkillResponse *> * _Nonnull task) {
        AWSAlexaforbusinessRejectSkillResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessResolveRoomResponse *> *)resolveRoom:(AWSAlexaforbusinessResolveRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"ResolveRoom"
                   outputClass:[AWSAlexaforbusinessResolveRoomResponse class]];
}

- (void)resolveRoom:(AWSAlexaforbusinessResolveRoomRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessResolveRoomResponse *response, NSError *error))completionHandler {
    [[self resolveRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessResolveRoomResponse *> * _Nonnull task) {
        AWSAlexaforbusinessResolveRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessRevokeInvitationResponse *> *)revokeInvitation:(AWSAlexaforbusinessRevokeInvitationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"RevokeInvitation"
                   outputClass:[AWSAlexaforbusinessRevokeInvitationResponse class]];
}

- (void)revokeInvitation:(AWSAlexaforbusinessRevokeInvitationRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessRevokeInvitationResponse *response, NSError *error))completionHandler {
    [[self revokeInvitation:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessRevokeInvitationResponse *> * _Nonnull task) {
        AWSAlexaforbusinessRevokeInvitationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSearchAddressBooksResponse *> *)searchAddressBooks:(AWSAlexaforbusinessSearchAddressBooksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SearchAddressBooks"
                   outputClass:[AWSAlexaforbusinessSearchAddressBooksResponse class]];
}

- (void)searchAddressBooks:(AWSAlexaforbusinessSearchAddressBooksRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSearchAddressBooksResponse *response, NSError *error))completionHandler {
    [[self searchAddressBooks:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSearchAddressBooksResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSearchAddressBooksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSearchContactsResponse *> *)searchContacts:(AWSAlexaforbusinessSearchContactsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SearchContacts"
                   outputClass:[AWSAlexaforbusinessSearchContactsResponse class]];
}

- (void)searchContacts:(AWSAlexaforbusinessSearchContactsRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSearchContactsResponse *response, NSError *error))completionHandler {
    [[self searchContacts:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSearchContactsResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSearchContactsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSearchDevicesResponse *> *)searchDevices:(AWSAlexaforbusinessSearchDevicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SearchDevices"
                   outputClass:[AWSAlexaforbusinessSearchDevicesResponse class]];
}

- (void)searchDevices:(AWSAlexaforbusinessSearchDevicesRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSearchDevicesResponse *response, NSError *error))completionHandler {
    [[self searchDevices:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSearchDevicesResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSearchDevicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSearchNetworkProfilesResponse *> *)searchNetworkProfiles:(AWSAlexaforbusinessSearchNetworkProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SearchNetworkProfiles"
                   outputClass:[AWSAlexaforbusinessSearchNetworkProfilesResponse class]];
}

- (void)searchNetworkProfiles:(AWSAlexaforbusinessSearchNetworkProfilesRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSearchNetworkProfilesResponse *response, NSError *error))completionHandler {
    [[self searchNetworkProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSearchNetworkProfilesResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSearchNetworkProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSearchProfilesResponse *> *)searchProfiles:(AWSAlexaforbusinessSearchProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SearchProfiles"
                   outputClass:[AWSAlexaforbusinessSearchProfilesResponse class]];
}

- (void)searchProfiles:(AWSAlexaforbusinessSearchProfilesRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSearchProfilesResponse *response, NSError *error))completionHandler {
    [[self searchProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSearchProfilesResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSearchProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSearchRoomsResponse *> *)searchRooms:(AWSAlexaforbusinessSearchRoomsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SearchRooms"
                   outputClass:[AWSAlexaforbusinessSearchRoomsResponse class]];
}

- (void)searchRooms:(AWSAlexaforbusinessSearchRoomsRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSearchRoomsResponse *response, NSError *error))completionHandler {
    [[self searchRooms:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSearchRoomsResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSearchRoomsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSearchSkillGroupsResponse *> *)searchSkillGroups:(AWSAlexaforbusinessSearchSkillGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SearchSkillGroups"
                   outputClass:[AWSAlexaforbusinessSearchSkillGroupsResponse class]];
}

- (void)searchSkillGroups:(AWSAlexaforbusinessSearchSkillGroupsRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSearchSkillGroupsResponse *response, NSError *error))completionHandler {
    [[self searchSkillGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSearchSkillGroupsResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSearchSkillGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSearchUsersResponse *> *)searchUsers:(AWSAlexaforbusinessSearchUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SearchUsers"
                   outputClass:[AWSAlexaforbusinessSearchUsersResponse class]];
}

- (void)searchUsers:(AWSAlexaforbusinessSearchUsersRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSearchUsersResponse *response, NSError *error))completionHandler {
    [[self searchUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSearchUsersResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSearchUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSendAnnouncementResponse *> *)sendAnnouncement:(AWSAlexaforbusinessSendAnnouncementRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SendAnnouncement"
                   outputClass:[AWSAlexaforbusinessSendAnnouncementResponse class]];
}

- (void)sendAnnouncement:(AWSAlexaforbusinessSendAnnouncementRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSendAnnouncementResponse *response, NSError *error))completionHandler {
    [[self sendAnnouncement:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSendAnnouncementResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSendAnnouncementResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessSendInvitationResponse *> *)sendInvitation:(AWSAlexaforbusinessSendInvitationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"SendInvitation"
                   outputClass:[AWSAlexaforbusinessSendInvitationResponse class]];
}

- (void)sendInvitation:(AWSAlexaforbusinessSendInvitationRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessSendInvitationResponse *response, NSError *error))completionHandler {
    [[self sendInvitation:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessSendInvitationResponse *> * _Nonnull task) {
        AWSAlexaforbusinessSendInvitationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessStartDeviceSyncResponse *> *)startDeviceSync:(AWSAlexaforbusinessStartDeviceSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"StartDeviceSync"
                   outputClass:[AWSAlexaforbusinessStartDeviceSyncResponse class]];
}

- (void)startDeviceSync:(AWSAlexaforbusinessStartDeviceSyncRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessStartDeviceSyncResponse *response, NSError *error))completionHandler {
    [[self startDeviceSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessStartDeviceSyncResponse *> * _Nonnull task) {
        AWSAlexaforbusinessStartDeviceSyncResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse *> *)startSmartHomeApplianceDiscovery:(AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"StartSmartHomeApplianceDiscovery"
                   outputClass:[AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse class]];
}

- (void)startSmartHomeApplianceDiscovery:(AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse *response, NSError *error))completionHandler {
    [[self startSmartHomeApplianceDiscovery:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse *> * _Nonnull task) {
        AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessTagResourceResponse *> *)tagResource:(AWSAlexaforbusinessTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"TagResource"
                   outputClass:[AWSAlexaforbusinessTagResourceResponse class]];
}

- (void)tagResource:(AWSAlexaforbusinessTagResourceRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessTagResourceResponse *> * _Nonnull task) {
        AWSAlexaforbusinessTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUntagResourceResponse *> *)untagResource:(AWSAlexaforbusinessUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UntagResource"
                   outputClass:[AWSAlexaforbusinessUntagResourceResponse class]];
}

- (void)untagResource:(AWSAlexaforbusinessUntagResourceRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUntagResourceResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateAddressBookResponse *> *)updateAddressBook:(AWSAlexaforbusinessUpdateAddressBookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateAddressBook"
                   outputClass:[AWSAlexaforbusinessUpdateAddressBookResponse class]];
}

- (void)updateAddressBook:(AWSAlexaforbusinessUpdateAddressBookRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateAddressBookResponse *response, NSError *error))completionHandler {
    [[self updateAddressBook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateAddressBookResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateAddressBookResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateBusinessReportScheduleResponse *> *)updateBusinessReportSchedule:(AWSAlexaforbusinessUpdateBusinessReportScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateBusinessReportSchedule"
                   outputClass:[AWSAlexaforbusinessUpdateBusinessReportScheduleResponse class]];
}

- (void)updateBusinessReportSchedule:(AWSAlexaforbusinessUpdateBusinessReportScheduleRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateBusinessReportScheduleResponse *response, NSError *error))completionHandler {
    [[self updateBusinessReportSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateBusinessReportScheduleResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateBusinessReportScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateConferenceProviderResponse *> *)updateConferenceProvider:(AWSAlexaforbusinessUpdateConferenceProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateConferenceProvider"
                   outputClass:[AWSAlexaforbusinessUpdateConferenceProviderResponse class]];
}

- (void)updateConferenceProvider:(AWSAlexaforbusinessUpdateConferenceProviderRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateConferenceProviderResponse *response, NSError *error))completionHandler {
    [[self updateConferenceProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateConferenceProviderResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateConferenceProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateContactResponse *> *)updateContact:(AWSAlexaforbusinessUpdateContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateContact"
                   outputClass:[AWSAlexaforbusinessUpdateContactResponse class]];
}

- (void)updateContact:(AWSAlexaforbusinessUpdateContactRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateContactResponse *response, NSError *error))completionHandler {
    [[self updateContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateContactResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateDeviceResponse *> *)updateDevice:(AWSAlexaforbusinessUpdateDeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateDevice"
                   outputClass:[AWSAlexaforbusinessUpdateDeviceResponse class]];
}

- (void)updateDevice:(AWSAlexaforbusinessUpdateDeviceRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateDeviceResponse *response, NSError *error))completionHandler {
    [[self updateDevice:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateDeviceResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateDeviceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateGatewayResponse *> *)updateGateway:(AWSAlexaforbusinessUpdateGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateGateway"
                   outputClass:[AWSAlexaforbusinessUpdateGatewayResponse class]];
}

- (void)updateGateway:(AWSAlexaforbusinessUpdateGatewayRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateGatewayResponse *response, NSError *error))completionHandler {
    [[self updateGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateGatewayResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateGatewayResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateGatewayGroupResponse *> *)updateGatewayGroup:(AWSAlexaforbusinessUpdateGatewayGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateGatewayGroup"
                   outputClass:[AWSAlexaforbusinessUpdateGatewayGroupResponse class]];
}

- (void)updateGatewayGroup:(AWSAlexaforbusinessUpdateGatewayGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateGatewayGroupResponse *response, NSError *error))completionHandler {
    [[self updateGatewayGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateGatewayGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateGatewayGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateNetworkProfileResponse *> *)updateNetworkProfile:(AWSAlexaforbusinessUpdateNetworkProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateNetworkProfile"
                   outputClass:[AWSAlexaforbusinessUpdateNetworkProfileResponse class]];
}

- (void)updateNetworkProfile:(AWSAlexaforbusinessUpdateNetworkProfileRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateNetworkProfileResponse *response, NSError *error))completionHandler {
    [[self updateNetworkProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateNetworkProfileResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateNetworkProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateProfileResponse *> *)updateProfile:(AWSAlexaforbusinessUpdateProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateProfile"
                   outputClass:[AWSAlexaforbusinessUpdateProfileResponse class]];
}

- (void)updateProfile:(AWSAlexaforbusinessUpdateProfileRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateProfileResponse *response, NSError *error))completionHandler {
    [[self updateProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateProfileResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateRoomResponse *> *)updateRoom:(AWSAlexaforbusinessUpdateRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateRoom"
                   outputClass:[AWSAlexaforbusinessUpdateRoomResponse class]];
}

- (void)updateRoom:(AWSAlexaforbusinessUpdateRoomRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateRoomResponse *response, NSError *error))completionHandler {
    [[self updateRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateRoomResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAlexaforbusinessUpdateSkillGroupResponse *> *)updateSkillGroup:(AWSAlexaforbusinessUpdateSkillGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AlexaForBusiness"
                 operationName:@"UpdateSkillGroup"
                   outputClass:[AWSAlexaforbusinessUpdateSkillGroupResponse class]];
}

- (void)updateSkillGroup:(AWSAlexaforbusinessUpdateSkillGroupRequest *)request
     completionHandler:(void (^)(AWSAlexaforbusinessUpdateSkillGroupResponse *response, NSError *error))completionHandler {
    [[self updateSkillGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAlexaforbusinessUpdateSkillGroupResponse *> * _Nonnull task) {
        AWSAlexaforbusinessUpdateSkillGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
