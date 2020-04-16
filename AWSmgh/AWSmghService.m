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

#import "AWSmghService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSmghResources.h"

static NSString *const AWSInfomgh = @"mgh";
NSString *const AWSmghSDKVersion = @"2.13.2";


@interface AWSmghResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSmghResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSmghErrorAccessDenied),
                            @"DryRunOperation" : @(AWSmghErrorDryRunOperation),
                            @"HomeRegionNotSetException" : @(AWSmghErrorHomeRegionNotSet),
                            @"InternalServerError" : @(AWSmghErrorInternalServer),
                            @"InvalidInputException" : @(AWSmghErrorInvalidInput),
                            @"PolicyErrorException" : @(AWSmghErrorPolicyError),
                            @"ResourceNotFoundException" : @(AWSmghErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSmghErrorServiceUnavailable),
                            @"ThrottlingException" : @(AWSmghErrorThrottling),
                            @"UnauthorizedOperation" : @(AWSmghErrorUnauthorizedOperation),
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
	                *error = [NSError errorWithDomain:AWSmghErrorDomain
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
        *error = [NSError errorWithDomain:AWSmghErrorDomain
                                     code:AWSmghErrorUnknown
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

@interface AWSmghRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSmghRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSmgh()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSmgh

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSmghSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSmgh versions need to match. Check your SDK installation. AWSCore: %@ AWSmgh: %@", AWSiOSSDKVersion, AWSmghSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultmgh {
    static AWSmgh *_defaultmgh = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfomgh];
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
        _defaultmgh = [[AWSmgh alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultmgh;
}

+ (void)registermghWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSmgh alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)mghForKey:(NSString *)key {
    @synchronized(self) {
        AWSmgh *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfomgh
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSmgh registermghWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removemghForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultmgh` or `+ mghForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicemgh
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicemgh];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSmghRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSmghResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSmghResponseSerializer alloc] initWithJSONDefinition:[[AWSmghResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSmghAssociateCreatedArtifactResult *> *)associateCreatedArtifact:(AWSmghAssociateCreatedArtifactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"AssociateCreatedArtifact"
                   outputClass:[AWSmghAssociateCreatedArtifactResult class]];
}

- (void)associateCreatedArtifact:(AWSmghAssociateCreatedArtifactRequest *)request
     completionHandler:(void (^)(AWSmghAssociateCreatedArtifactResult *response, NSError *error))completionHandler {
    [[self associateCreatedArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghAssociateCreatedArtifactResult *> * _Nonnull task) {
        AWSmghAssociateCreatedArtifactResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghAssociateDiscoveredResourceResult *> *)associateDiscoveredResource:(AWSmghAssociateDiscoveredResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"AssociateDiscoveredResource"
                   outputClass:[AWSmghAssociateDiscoveredResourceResult class]];
}

- (void)associateDiscoveredResource:(AWSmghAssociateDiscoveredResourceRequest *)request
     completionHandler:(void (^)(AWSmghAssociateDiscoveredResourceResult *response, NSError *error))completionHandler {
    [[self associateDiscoveredResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghAssociateDiscoveredResourceResult *> * _Nonnull task) {
        AWSmghAssociateDiscoveredResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghCreateProgressUpdateStreamResult *> *)createProgressUpdateStream:(AWSmghCreateProgressUpdateStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"CreateProgressUpdateStream"
                   outputClass:[AWSmghCreateProgressUpdateStreamResult class]];
}

- (void)createProgressUpdateStream:(AWSmghCreateProgressUpdateStreamRequest *)request
     completionHandler:(void (^)(AWSmghCreateProgressUpdateStreamResult *response, NSError *error))completionHandler {
    [[self createProgressUpdateStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghCreateProgressUpdateStreamResult *> * _Nonnull task) {
        AWSmghCreateProgressUpdateStreamResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghDeleteProgressUpdateStreamResult *> *)deleteProgressUpdateStream:(AWSmghDeleteProgressUpdateStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"DeleteProgressUpdateStream"
                   outputClass:[AWSmghDeleteProgressUpdateStreamResult class]];
}

- (void)deleteProgressUpdateStream:(AWSmghDeleteProgressUpdateStreamRequest *)request
     completionHandler:(void (^)(AWSmghDeleteProgressUpdateStreamResult *response, NSError *error))completionHandler {
    [[self deleteProgressUpdateStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghDeleteProgressUpdateStreamResult *> * _Nonnull task) {
        AWSmghDeleteProgressUpdateStreamResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghDescribeApplicationStateResult *> *)describeApplicationState:(AWSmghDescribeApplicationStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"DescribeApplicationState"
                   outputClass:[AWSmghDescribeApplicationStateResult class]];
}

- (void)describeApplicationState:(AWSmghDescribeApplicationStateRequest *)request
     completionHandler:(void (^)(AWSmghDescribeApplicationStateResult *response, NSError *error))completionHandler {
    [[self describeApplicationState:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghDescribeApplicationStateResult *> * _Nonnull task) {
        AWSmghDescribeApplicationStateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghDescribeMigrationTaskResult *> *)describeMigrationTask:(AWSmghDescribeMigrationTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"DescribeMigrationTask"
                   outputClass:[AWSmghDescribeMigrationTaskResult class]];
}

- (void)describeMigrationTask:(AWSmghDescribeMigrationTaskRequest *)request
     completionHandler:(void (^)(AWSmghDescribeMigrationTaskResult *response, NSError *error))completionHandler {
    [[self describeMigrationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghDescribeMigrationTaskResult *> * _Nonnull task) {
        AWSmghDescribeMigrationTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghDisassociateCreatedArtifactResult *> *)disassociateCreatedArtifact:(AWSmghDisassociateCreatedArtifactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"DisassociateCreatedArtifact"
                   outputClass:[AWSmghDisassociateCreatedArtifactResult class]];
}

- (void)disassociateCreatedArtifact:(AWSmghDisassociateCreatedArtifactRequest *)request
     completionHandler:(void (^)(AWSmghDisassociateCreatedArtifactResult *response, NSError *error))completionHandler {
    [[self disassociateCreatedArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghDisassociateCreatedArtifactResult *> * _Nonnull task) {
        AWSmghDisassociateCreatedArtifactResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghDisassociateDiscoveredResourceResult *> *)disassociateDiscoveredResource:(AWSmghDisassociateDiscoveredResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"DisassociateDiscoveredResource"
                   outputClass:[AWSmghDisassociateDiscoveredResourceResult class]];
}

- (void)disassociateDiscoveredResource:(AWSmghDisassociateDiscoveredResourceRequest *)request
     completionHandler:(void (^)(AWSmghDisassociateDiscoveredResourceResult *response, NSError *error))completionHandler {
    [[self disassociateDiscoveredResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghDisassociateDiscoveredResourceResult *> * _Nonnull task) {
        AWSmghDisassociateDiscoveredResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghImportMigrationTaskResult *> *)importMigrationTask:(AWSmghImportMigrationTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"ImportMigrationTask"
                   outputClass:[AWSmghImportMigrationTaskResult class]];
}

- (void)importMigrationTask:(AWSmghImportMigrationTaskRequest *)request
     completionHandler:(void (^)(AWSmghImportMigrationTaskResult *response, NSError *error))completionHandler {
    [[self importMigrationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghImportMigrationTaskResult *> * _Nonnull task) {
        AWSmghImportMigrationTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghListApplicationStatesResult *> *)listApplicationStates:(AWSmghListApplicationStatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"ListApplicationStates"
                   outputClass:[AWSmghListApplicationStatesResult class]];
}

- (void)listApplicationStates:(AWSmghListApplicationStatesRequest *)request
     completionHandler:(void (^)(AWSmghListApplicationStatesResult *response, NSError *error))completionHandler {
    [[self listApplicationStates:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghListApplicationStatesResult *> * _Nonnull task) {
        AWSmghListApplicationStatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghListCreatedArtifactsResult *> *)listCreatedArtifacts:(AWSmghListCreatedArtifactsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"ListCreatedArtifacts"
                   outputClass:[AWSmghListCreatedArtifactsResult class]];
}

- (void)listCreatedArtifacts:(AWSmghListCreatedArtifactsRequest *)request
     completionHandler:(void (^)(AWSmghListCreatedArtifactsResult *response, NSError *error))completionHandler {
    [[self listCreatedArtifacts:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghListCreatedArtifactsResult *> * _Nonnull task) {
        AWSmghListCreatedArtifactsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghListDiscoveredResourcesResult *> *)listDiscoveredResources:(AWSmghListDiscoveredResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"ListDiscoveredResources"
                   outputClass:[AWSmghListDiscoveredResourcesResult class]];
}

- (void)listDiscoveredResources:(AWSmghListDiscoveredResourcesRequest *)request
     completionHandler:(void (^)(AWSmghListDiscoveredResourcesResult *response, NSError *error))completionHandler {
    [[self listDiscoveredResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghListDiscoveredResourcesResult *> * _Nonnull task) {
        AWSmghListDiscoveredResourcesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghListMigrationTasksResult *> *)listMigrationTasks:(AWSmghListMigrationTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"ListMigrationTasks"
                   outputClass:[AWSmghListMigrationTasksResult class]];
}

- (void)listMigrationTasks:(AWSmghListMigrationTasksRequest *)request
     completionHandler:(void (^)(AWSmghListMigrationTasksResult *response, NSError *error))completionHandler {
    [[self listMigrationTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghListMigrationTasksResult *> * _Nonnull task) {
        AWSmghListMigrationTasksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghListProgressUpdateStreamsResult *> *)listProgressUpdateStreams:(AWSmghListProgressUpdateStreamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"ListProgressUpdateStreams"
                   outputClass:[AWSmghListProgressUpdateStreamsResult class]];
}

- (void)listProgressUpdateStreams:(AWSmghListProgressUpdateStreamsRequest *)request
     completionHandler:(void (^)(AWSmghListProgressUpdateStreamsResult *response, NSError *error))completionHandler {
    [[self listProgressUpdateStreams:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghListProgressUpdateStreamsResult *> * _Nonnull task) {
        AWSmghListProgressUpdateStreamsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghNotifyApplicationStateResult *> *)notifyApplicationState:(AWSmghNotifyApplicationStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"NotifyApplicationState"
                   outputClass:[AWSmghNotifyApplicationStateResult class]];
}

- (void)notifyApplicationState:(AWSmghNotifyApplicationStateRequest *)request
     completionHandler:(void (^)(AWSmghNotifyApplicationStateResult *response, NSError *error))completionHandler {
    [[self notifyApplicationState:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghNotifyApplicationStateResult *> * _Nonnull task) {
        AWSmghNotifyApplicationStateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghNotifyMigrationTaskStateResult *> *)notifyMigrationTaskState:(AWSmghNotifyMigrationTaskStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"NotifyMigrationTaskState"
                   outputClass:[AWSmghNotifyMigrationTaskStateResult class]];
}

- (void)notifyMigrationTaskState:(AWSmghNotifyMigrationTaskStateRequest *)request
     completionHandler:(void (^)(AWSmghNotifyMigrationTaskStateResult *response, NSError *error))completionHandler {
    [[self notifyMigrationTaskState:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghNotifyMigrationTaskStateResult *> * _Nonnull task) {
        AWSmghNotifyMigrationTaskStateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmghPutResourceAttributesResult *> *)putResourceAttributes:(AWSmghPutResourceAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSMigrationHub"
                 operationName:@"PutResourceAttributes"
                   outputClass:[AWSmghPutResourceAttributesResult class]];
}

- (void)putResourceAttributes:(AWSmghPutResourceAttributesRequest *)request
     completionHandler:(void (^)(AWSmghPutResourceAttributesResult *response, NSError *error))completionHandler {
    [[self putResourceAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSmghPutResourceAttributesResult *> * _Nonnull task) {
        AWSmghPutResourceAttributesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
