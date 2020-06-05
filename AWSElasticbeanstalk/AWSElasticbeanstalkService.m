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

#import "AWSElasticbeanstalkService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSElasticbeanstalkResources.h"

static NSString *const AWSInfoElasticbeanstalk = @"Elasticbeanstalk";
NSString *const AWSElasticbeanstalkSDKVersion = @"2.13.4";


@interface AWSElasticbeanstalkResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSElasticbeanstalkResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"CodeBuildNotInServiceRegionException" : @(AWSElasticbeanstalkErrorCodeBuildNotInServiceRegion),
                            @"ElasticBeanstalkServiceException" : @(AWSElasticbeanstalkErrorElasticBeanstalkService),
                            @"InsufficientPrivilegesException" : @(AWSElasticbeanstalkErrorInsufficientPrivileges),
                            @"InvalidRequestException" : @(AWSElasticbeanstalkErrorInvalidRequest),
                            @"ManagedActionInvalidStateException" : @(AWSElasticbeanstalkErrorManagedActionInvalidState),
                            @"OperationInProgressFailure" : @(AWSElasticbeanstalkErrorOperationInProgress),
                            @"PlatformVersionStillReferencedException" : @(AWSElasticbeanstalkErrorPlatformVersionStillReferenced),
                            @"ResourceNotFoundException" : @(AWSElasticbeanstalkErrorResourceNotFound),
                            @"ResourceTypeNotSupportedException" : @(AWSElasticbeanstalkErrorResourceTypeNotSupported),
                            @"S3LocationNotInServiceRegionException" : @(AWSElasticbeanstalkErrorS3LocationNotInServiceRegion),
                            @"S3SubscriptionRequiredException" : @(AWSElasticbeanstalkErrorS3SubscriptionRequired),
                            @"SourceBundleDeletionFailure" : @(AWSElasticbeanstalkErrorSourceBundleDeletion),
                            @"TooManyApplicationVersionsException" : @(AWSElasticbeanstalkErrorTooManyApplicationVersions),
                            @"TooManyApplicationsException" : @(AWSElasticbeanstalkErrorTooManyApplications),
                            @"TooManyBucketsException" : @(AWSElasticbeanstalkErrorTooManyBuckets),
                            @"TooManyConfigurationTemplatesException" : @(AWSElasticbeanstalkErrorTooManyConfigurationTemplates),
                            @"TooManyEnvironmentsException" : @(AWSElasticbeanstalkErrorTooManyEnvironments),
                            @"TooManyPlatformsException" : @(AWSElasticbeanstalkErrorTooManyPlatforms),
                            @"TooManyTagsException" : @(AWSElasticbeanstalkErrorTooManyTags),
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

        NSDictionary *errorInfo = responseObject[@"Error"];
        if (errorInfo[@"Code"] && errorCodeDictionary[errorInfo[@"Code"]]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSElasticbeanstalkErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                         ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSElasticbeanstalkErrorDomain
                                             code:AWSElasticbeanstalkErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSElasticbeanstalkErrorDomain
                                     code:AWSElasticbeanstalkErrorUnknown
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

@interface AWSElasticbeanstalkRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSElasticbeanstalkRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSElasticbeanstalk()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSElasticbeanstalk

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSElasticbeanstalkSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSElasticbeanstalk versions need to match. Check your SDK installation. AWSCore: %@ AWSElasticbeanstalk: %@", AWSiOSSDKVersion, AWSElasticbeanstalkSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultElasticbeanstalk {
    static AWSElasticbeanstalk *_defaultElasticbeanstalk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoElasticbeanstalk];
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
        _defaultElasticbeanstalk = [[AWSElasticbeanstalk alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultElasticbeanstalk;
}

+ (void)registerElasticbeanstalkWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSElasticbeanstalk alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ElasticbeanstalkForKey:(NSString *)key {
    @synchronized(self) {
        AWSElasticbeanstalk *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoElasticbeanstalk
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeElasticbeanstalkForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultElasticbeanstalk` or `+ ElasticbeanstalkForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceElasticbeanstalk
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceElasticbeanstalk];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSElasticbeanstalkRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSElasticbeanstalkResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSElasticbeanstalkResponseSerializer alloc] initWithJSONDefinition:[[AWSElasticbeanstalkResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)abortEnvironmentUpdate:(AWSElasticbeanstalkAbortEnvironmentUpdateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AbortEnvironmentUpdate"
                   outputClass:nil];
}

- (void)abortEnvironmentUpdate:(AWSElasticbeanstalkAbortEnvironmentUpdateMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self abortEnvironmentUpdate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkApplyEnvironmentManagedActionResult *> *)applyEnvironmentManagedAction:(AWSElasticbeanstalkApplyEnvironmentManagedActionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ApplyEnvironmentManagedAction"
                   outputClass:[AWSElasticbeanstalkApplyEnvironmentManagedActionResult class]];
}

- (void)applyEnvironmentManagedAction:(AWSElasticbeanstalkApplyEnvironmentManagedActionRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkApplyEnvironmentManagedActionResult *response, NSError *error))completionHandler {
    [[self applyEnvironmentManagedAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkApplyEnvironmentManagedActionResult *> * _Nonnull task) {
        AWSElasticbeanstalkApplyEnvironmentManagedActionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)associateEnvironmentOperationsRole:(AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateEnvironmentOperationsRole"
                   outputClass:nil];
}

- (void)associateEnvironmentOperationsRole:(AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateEnvironmentOperationsRole:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkCheckDNSAvailabilityResultMessage *> *)checkDNSAvailability:(AWSElasticbeanstalkCheckDNSAvailabilityMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CheckDNSAvailability"
                   outputClass:[AWSElasticbeanstalkCheckDNSAvailabilityResultMessage class]];
}

- (void)checkDNSAvailability:(AWSElasticbeanstalkCheckDNSAvailabilityMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkCheckDNSAvailabilityResultMessage *response, NSError *error))completionHandler {
    [[self checkDNSAvailability:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkCheckDNSAvailabilityResultMessage *> * _Nonnull task) {
        AWSElasticbeanstalkCheckDNSAvailabilityResultMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkEnvironmentDescriptionsMessage *> *)composeEnvironments:(AWSElasticbeanstalkComposeEnvironmentsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ComposeEnvironments"
                   outputClass:[AWSElasticbeanstalkEnvironmentDescriptionsMessage class]];
}

- (void)composeEnvironments:(AWSElasticbeanstalkComposeEnvironmentsMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkEnvironmentDescriptionsMessage *response, NSError *error))completionHandler {
    [[self composeEnvironments:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkEnvironmentDescriptionsMessage *> * _Nonnull task) {
        AWSElasticbeanstalkEnvironmentDescriptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkApplicationDescriptionMessage *> *)createApplication:(AWSElasticbeanstalkCreateApplicationMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateApplication"
                   outputClass:[AWSElasticbeanstalkApplicationDescriptionMessage class]];
}

- (void)createApplication:(AWSElasticbeanstalkCreateApplicationMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkApplicationDescriptionMessage *response, NSError *error))completionHandler {
    [[self createApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkApplicationDescriptionMessage *> * _Nonnull task) {
        AWSElasticbeanstalkApplicationDescriptionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkApplicationVersionDescriptionMessage *> *)createApplicationVersion:(AWSElasticbeanstalkCreateApplicationVersionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateApplicationVersion"
                   outputClass:[AWSElasticbeanstalkApplicationVersionDescriptionMessage class]];
}

- (void)createApplicationVersion:(AWSElasticbeanstalkCreateApplicationVersionMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkApplicationVersionDescriptionMessage *response, NSError *error))completionHandler {
    [[self createApplicationVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkApplicationVersionDescriptionMessage *> * _Nonnull task) {
        AWSElasticbeanstalkApplicationVersionDescriptionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkConfigurationSettingsDescription *> *)createConfigurationTemplate:(AWSElasticbeanstalkCreateConfigurationTemplateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateConfigurationTemplate"
                   outputClass:[AWSElasticbeanstalkConfigurationSettingsDescription class]];
}

- (void)createConfigurationTemplate:(AWSElasticbeanstalkCreateConfigurationTemplateMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkConfigurationSettingsDescription *response, NSError *error))completionHandler {
    [[self createConfigurationTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkConfigurationSettingsDescription *> * _Nonnull task) {
        AWSElasticbeanstalkConfigurationSettingsDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkEnvironmentDescription *> *)createEnvironment:(AWSElasticbeanstalkCreateEnvironmentMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateEnvironment"
                   outputClass:[AWSElasticbeanstalkEnvironmentDescription class]];
}

- (void)createEnvironment:(AWSElasticbeanstalkCreateEnvironmentMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkEnvironmentDescription *response, NSError *error))completionHandler {
    [[self createEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkEnvironmentDescription *> * _Nonnull task) {
        AWSElasticbeanstalkEnvironmentDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkCreatePlatformVersionResult *> *)createPlatformVersion:(AWSElasticbeanstalkCreatePlatformVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlatformVersion"
                   outputClass:[AWSElasticbeanstalkCreatePlatformVersionResult class]];
}

- (void)createPlatformVersion:(AWSElasticbeanstalkCreatePlatformVersionRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkCreatePlatformVersionResult *response, NSError *error))completionHandler {
    [[self createPlatformVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkCreatePlatformVersionResult *> * _Nonnull task) {
        AWSElasticbeanstalkCreatePlatformVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkCreateStorageLocationResultMessage *> *)createStorageLocation:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateStorageLocation"
                   outputClass:[AWSElasticbeanstalkCreateStorageLocationResultMessage class]];
}

- (void)createStorageLocation:(AWSRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkCreateStorageLocationResultMessage *response, NSError *error))completionHandler {
    [[self createStorageLocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkCreateStorageLocationResultMessage *> * _Nonnull task) {
        AWSElasticbeanstalkCreateStorageLocationResultMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApplication:(AWSElasticbeanstalkDeleteApplicationMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteApplication"
                   outputClass:nil];
}

- (void)deleteApplication:(AWSElasticbeanstalkDeleteApplicationMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApplication:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApplicationVersion:(AWSElasticbeanstalkDeleteApplicationVersionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteApplicationVersion"
                   outputClass:nil];
}

- (void)deleteApplicationVersion:(AWSElasticbeanstalkDeleteApplicationVersionMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApplicationVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteConfigurationTemplate:(AWSElasticbeanstalkDeleteConfigurationTemplateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteConfigurationTemplate"
                   outputClass:nil];
}

- (void)deleteConfigurationTemplate:(AWSElasticbeanstalkDeleteConfigurationTemplateMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteConfigurationTemplate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEnvironmentConfiguration:(AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteEnvironmentConfiguration"
                   outputClass:nil];
}

- (void)deleteEnvironmentConfiguration:(AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEnvironmentConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkDeletePlatformVersionResult *> *)deletePlatformVersion:(AWSElasticbeanstalkDeletePlatformVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePlatformVersion"
                   outputClass:[AWSElasticbeanstalkDeletePlatformVersionResult class]];
}

- (void)deletePlatformVersion:(AWSElasticbeanstalkDeletePlatformVersionRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkDeletePlatformVersionResult *response, NSError *error))completionHandler {
    [[self deletePlatformVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkDeletePlatformVersionResult *> * _Nonnull task) {
        AWSElasticbeanstalkDeletePlatformVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkDescribeAccountAttributesResult *> *)describeAccountAttributes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSElasticbeanstalkDescribeAccountAttributesResult class]];
}

- (void)describeAccountAttributes:(AWSRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkDescribeAccountAttributesResult *response, NSError *error))completionHandler {
    [[self describeAccountAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkDescribeAccountAttributesResult *> * _Nonnull task) {
        AWSElasticbeanstalkDescribeAccountAttributesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkApplicationVersionDescriptionsMessage *> *)describeApplicationVersions:(AWSElasticbeanstalkDescribeApplicationVersionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeApplicationVersions"
                   outputClass:[AWSElasticbeanstalkApplicationVersionDescriptionsMessage class]];
}

- (void)describeApplicationVersions:(AWSElasticbeanstalkDescribeApplicationVersionsMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkApplicationVersionDescriptionsMessage *response, NSError *error))completionHandler {
    [[self describeApplicationVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkApplicationVersionDescriptionsMessage *> * _Nonnull task) {
        AWSElasticbeanstalkApplicationVersionDescriptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkApplicationDescriptionsMessage *> *)describeApplications:(AWSElasticbeanstalkDescribeApplicationsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeApplications"
                   outputClass:[AWSElasticbeanstalkApplicationDescriptionsMessage class]];
}

- (void)describeApplications:(AWSElasticbeanstalkDescribeApplicationsMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkApplicationDescriptionsMessage *response, NSError *error))completionHandler {
    [[self describeApplications:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkApplicationDescriptionsMessage *> * _Nonnull task) {
        AWSElasticbeanstalkApplicationDescriptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkConfigurationOptionsDescription *> *)describeConfigurationOptions:(AWSElasticbeanstalkDescribeConfigurationOptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeConfigurationOptions"
                   outputClass:[AWSElasticbeanstalkConfigurationOptionsDescription class]];
}

- (void)describeConfigurationOptions:(AWSElasticbeanstalkDescribeConfigurationOptionsMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkConfigurationOptionsDescription *response, NSError *error))completionHandler {
    [[self describeConfigurationOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkConfigurationOptionsDescription *> * _Nonnull task) {
        AWSElasticbeanstalkConfigurationOptionsDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkConfigurationSettingsDescriptions *> *)describeConfigurationSettings:(AWSElasticbeanstalkDescribeConfigurationSettingsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeConfigurationSettings"
                   outputClass:[AWSElasticbeanstalkConfigurationSettingsDescriptions class]];
}

- (void)describeConfigurationSettings:(AWSElasticbeanstalkDescribeConfigurationSettingsMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkConfigurationSettingsDescriptions *response, NSError *error))completionHandler {
    [[self describeConfigurationSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkConfigurationSettingsDescriptions *> * _Nonnull task) {
        AWSElasticbeanstalkConfigurationSettingsDescriptions *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkDescribeEnvironmentHealthResult *> *)describeEnvironmentHealth:(AWSElasticbeanstalkDescribeEnvironmentHealthRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEnvironmentHealth"
                   outputClass:[AWSElasticbeanstalkDescribeEnvironmentHealthResult class]];
}

- (void)describeEnvironmentHealth:(AWSElasticbeanstalkDescribeEnvironmentHealthRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkDescribeEnvironmentHealthResult *response, NSError *error))completionHandler {
    [[self describeEnvironmentHealth:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkDescribeEnvironmentHealthResult *> * _Nonnull task) {
        AWSElasticbeanstalkDescribeEnvironmentHealthResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult *> *)describeEnvironmentManagedActionHistory:(AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEnvironmentManagedActionHistory"
                   outputClass:[AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult class]];
}

- (void)describeEnvironmentManagedActionHistory:(AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult *response, NSError *error))completionHandler {
    [[self describeEnvironmentManagedActionHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult *> * _Nonnull task) {
        AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult *> *)describeEnvironmentManagedActions:(AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEnvironmentManagedActions"
                   outputClass:[AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult class]];
}

- (void)describeEnvironmentManagedActions:(AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult *response, NSError *error))completionHandler {
    [[self describeEnvironmentManagedActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult *> * _Nonnull task) {
        AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage *> *)describeEnvironmentResources:(AWSElasticbeanstalkDescribeEnvironmentResourcesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEnvironmentResources"
                   outputClass:[AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage class]];
}

- (void)describeEnvironmentResources:(AWSElasticbeanstalkDescribeEnvironmentResourcesMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage *response, NSError *error))completionHandler {
    [[self describeEnvironmentResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage *> * _Nonnull task) {
        AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkEnvironmentDescriptionsMessage *> *)describeEnvironments:(AWSElasticbeanstalkDescribeEnvironmentsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEnvironments"
                   outputClass:[AWSElasticbeanstalkEnvironmentDescriptionsMessage class]];
}

- (void)describeEnvironments:(AWSElasticbeanstalkDescribeEnvironmentsMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkEnvironmentDescriptionsMessage *response, NSError *error))completionHandler {
    [[self describeEnvironments:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkEnvironmentDescriptionsMessage *> * _Nonnull task) {
        AWSElasticbeanstalkEnvironmentDescriptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkEventDescriptionsMessage *> *)describeEvents:(AWSElasticbeanstalkDescribeEventsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEvents"
                   outputClass:[AWSElasticbeanstalkEventDescriptionsMessage class]];
}

- (void)describeEvents:(AWSElasticbeanstalkDescribeEventsMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkEventDescriptionsMessage *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkEventDescriptionsMessage *> * _Nonnull task) {
        AWSElasticbeanstalkEventDescriptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkDescribeInstancesHealthResult *> *)describeInstancesHealth:(AWSElasticbeanstalkDescribeInstancesHealthRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstancesHealth"
                   outputClass:[AWSElasticbeanstalkDescribeInstancesHealthResult class]];
}

- (void)describeInstancesHealth:(AWSElasticbeanstalkDescribeInstancesHealthRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkDescribeInstancesHealthResult *response, NSError *error))completionHandler {
    [[self describeInstancesHealth:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkDescribeInstancesHealthResult *> * _Nonnull task) {
        AWSElasticbeanstalkDescribeInstancesHealthResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkDescribePlatformVersionResult *> *)describePlatformVersion:(AWSElasticbeanstalkDescribePlatformVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePlatformVersion"
                   outputClass:[AWSElasticbeanstalkDescribePlatformVersionResult class]];
}

- (void)describePlatformVersion:(AWSElasticbeanstalkDescribePlatformVersionRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkDescribePlatformVersionResult *response, NSError *error))completionHandler {
    [[self describePlatformVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkDescribePlatformVersionResult *> * _Nonnull task) {
        AWSElasticbeanstalkDescribePlatformVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateEnvironmentOperationsRole:(AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateEnvironmentOperationsRole"
                   outputClass:nil];
}

- (void)disassociateEnvironmentOperationsRole:(AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateEnvironmentOperationsRole:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkListAvailableSolutionStacksResultMessage *> *)listAvailableSolutionStacks:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListAvailableSolutionStacks"
                   outputClass:[AWSElasticbeanstalkListAvailableSolutionStacksResultMessage class]];
}

- (void)listAvailableSolutionStacks:(AWSRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkListAvailableSolutionStacksResultMessage *response, NSError *error))completionHandler {
    [[self listAvailableSolutionStacks:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkListAvailableSolutionStacksResultMessage *> * _Nonnull task) {
        AWSElasticbeanstalkListAvailableSolutionStacksResultMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkListPlatformBranchesResult *> *)listPlatformBranches:(AWSElasticbeanstalkListPlatformBranchesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListPlatformBranches"
                   outputClass:[AWSElasticbeanstalkListPlatformBranchesResult class]];
}

- (void)listPlatformBranches:(AWSElasticbeanstalkListPlatformBranchesRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkListPlatformBranchesResult *response, NSError *error))completionHandler {
    [[self listPlatformBranches:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkListPlatformBranchesResult *> * _Nonnull task) {
        AWSElasticbeanstalkListPlatformBranchesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkListPlatformVersionsResult *> *)listPlatformVersions:(AWSElasticbeanstalkListPlatformVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListPlatformVersions"
                   outputClass:[AWSElasticbeanstalkListPlatformVersionsResult class]];
}

- (void)listPlatformVersions:(AWSElasticbeanstalkListPlatformVersionsRequest *)request
     completionHandler:(void (^)(AWSElasticbeanstalkListPlatformVersionsResult *response, NSError *error))completionHandler {
    [[self listPlatformVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkListPlatformVersionsResult *> * _Nonnull task) {
        AWSElasticbeanstalkListPlatformVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkResourceTagsDescriptionMessage *> *)listTagsForResource:(AWSElasticbeanstalkListTagsForResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSElasticbeanstalkResourceTagsDescriptionMessage class]];
}

- (void)listTagsForResource:(AWSElasticbeanstalkListTagsForResourceMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkResourceTagsDescriptionMessage *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkResourceTagsDescriptionMessage *> * _Nonnull task) {
        AWSElasticbeanstalkResourceTagsDescriptionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)rebuildEnvironment:(AWSElasticbeanstalkRebuildEnvironmentMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RebuildEnvironment"
                   outputClass:nil];
}

- (void)rebuildEnvironment:(AWSElasticbeanstalkRebuildEnvironmentMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self rebuildEnvironment:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)requestEnvironmentInfo:(AWSElasticbeanstalkRequestEnvironmentInfoMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RequestEnvironmentInfo"
                   outputClass:nil];
}

- (void)requestEnvironmentInfo:(AWSElasticbeanstalkRequestEnvironmentInfoMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self requestEnvironmentInfo:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)restartAppServer:(AWSElasticbeanstalkRestartAppServerMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestartAppServer"
                   outputClass:nil];
}

- (void)restartAppServer:(AWSElasticbeanstalkRestartAppServerMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self restartAppServer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage *> *)retrieveEnvironmentInfo:(AWSElasticbeanstalkRetrieveEnvironmentInfoMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RetrieveEnvironmentInfo"
                   outputClass:[AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage class]];
}

- (void)retrieveEnvironmentInfo:(AWSElasticbeanstalkRetrieveEnvironmentInfoMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage *response, NSError *error))completionHandler {
    [[self retrieveEnvironmentInfo:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage *> * _Nonnull task) {
        AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)swapEnvironmentCNAMEs:(AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SwapEnvironmentCNAMEs"
                   outputClass:nil];
}

- (void)swapEnvironmentCNAMEs:(AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self swapEnvironmentCNAMEs:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkEnvironmentDescription *> *)terminateEnvironment:(AWSElasticbeanstalkTerminateEnvironmentMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TerminateEnvironment"
                   outputClass:[AWSElasticbeanstalkEnvironmentDescription class]];
}

- (void)terminateEnvironment:(AWSElasticbeanstalkTerminateEnvironmentMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkEnvironmentDescription *response, NSError *error))completionHandler {
    [[self terminateEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkEnvironmentDescription *> * _Nonnull task) {
        AWSElasticbeanstalkEnvironmentDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkApplicationDescriptionMessage *> *)updateApplication:(AWSElasticbeanstalkUpdateApplicationMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateApplication"
                   outputClass:[AWSElasticbeanstalkApplicationDescriptionMessage class]];
}

- (void)updateApplication:(AWSElasticbeanstalkUpdateApplicationMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkApplicationDescriptionMessage *response, NSError *error))completionHandler {
    [[self updateApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkApplicationDescriptionMessage *> * _Nonnull task) {
        AWSElasticbeanstalkApplicationDescriptionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage *> *)updateApplicationResourceLifecycle:(AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateApplicationResourceLifecycle"
                   outputClass:[AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage class]];
}

- (void)updateApplicationResourceLifecycle:(AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage *response, NSError *error))completionHandler {
    [[self updateApplicationResourceLifecycle:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage *> * _Nonnull task) {
        AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkApplicationVersionDescriptionMessage *> *)updateApplicationVersion:(AWSElasticbeanstalkUpdateApplicationVersionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateApplicationVersion"
                   outputClass:[AWSElasticbeanstalkApplicationVersionDescriptionMessage class]];
}

- (void)updateApplicationVersion:(AWSElasticbeanstalkUpdateApplicationVersionMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkApplicationVersionDescriptionMessage *response, NSError *error))completionHandler {
    [[self updateApplicationVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkApplicationVersionDescriptionMessage *> * _Nonnull task) {
        AWSElasticbeanstalkApplicationVersionDescriptionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkConfigurationSettingsDescription *> *)updateConfigurationTemplate:(AWSElasticbeanstalkUpdateConfigurationTemplateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateConfigurationTemplate"
                   outputClass:[AWSElasticbeanstalkConfigurationSettingsDescription class]];
}

- (void)updateConfigurationTemplate:(AWSElasticbeanstalkUpdateConfigurationTemplateMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkConfigurationSettingsDescription *response, NSError *error))completionHandler {
    [[self updateConfigurationTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkConfigurationSettingsDescription *> * _Nonnull task) {
        AWSElasticbeanstalkConfigurationSettingsDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkEnvironmentDescription *> *)updateEnvironment:(AWSElasticbeanstalkUpdateEnvironmentMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateEnvironment"
                   outputClass:[AWSElasticbeanstalkEnvironmentDescription class]];
}

- (void)updateEnvironment:(AWSElasticbeanstalkUpdateEnvironmentMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkEnvironmentDescription *response, NSError *error))completionHandler {
    [[self updateEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkEnvironmentDescription *> * _Nonnull task) {
        AWSElasticbeanstalkEnvironmentDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateTagsForResource:(AWSElasticbeanstalkUpdateTagsForResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateTagsForResource"
                   outputClass:nil];
}

- (void)updateTagsForResource:(AWSElasticbeanstalkUpdateTagsForResourceMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticbeanstalkConfigurationSettingsValidationMessages *> *)validateConfigurationSettings:(AWSElasticbeanstalkValidateConfigurationSettingsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ValidateConfigurationSettings"
                   outputClass:[AWSElasticbeanstalkConfigurationSettingsValidationMessages class]];
}

- (void)validateConfigurationSettings:(AWSElasticbeanstalkValidateConfigurationSettingsMessage *)request
     completionHandler:(void (^)(AWSElasticbeanstalkConfigurationSettingsValidationMessages *response, NSError *error))completionHandler {
    [[self validateConfigurationSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticbeanstalkConfigurationSettingsValidationMessages *> * _Nonnull task) {
        AWSElasticbeanstalkConfigurationSettingsValidationMessages *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
