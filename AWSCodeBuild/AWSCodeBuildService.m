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

#import "AWSCodeBuildService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSCodeBuildResources.h"

static NSString *const AWSInfoCodeBuild = @"CodeBuild";
NSString *const AWSCodeBuildSDKVersion = @"2.13.3";


@interface AWSCodeBuildResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSCodeBuildResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccountLimitExceededException" : @(AWSCodeBuildErrorAccountLimitExceeded),
                            @"InvalidInputException" : @(AWSCodeBuildErrorInvalidInput),
                            @"OAuthProviderException" : @(AWSCodeBuildErrorOAuthProvider),
                            @"ResourceAlreadyExistsException" : @(AWSCodeBuildErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSCodeBuildErrorResourceNotFound),
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
	                *error = [NSError errorWithDomain:AWSCodeBuildErrorDomain
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
        *error = [NSError errorWithDomain:AWSCodeBuildErrorDomain
                                     code:AWSCodeBuildErrorUnknown
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

@interface AWSCodeBuildRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCodeBuildRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCodeBuild()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCodeBuild

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSCodeBuildSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSCodeBuild versions need to match. Check your SDK installation. AWSCore: %@ AWSCodeBuild: %@", AWSiOSSDKVersion, AWSCodeBuildSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCodeBuild {
    static AWSCodeBuild *_defaultCodeBuild = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCodeBuild];
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
        _defaultCodeBuild = [[AWSCodeBuild alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCodeBuild;
}

+ (void)registerCodeBuildWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCodeBuild alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CodeBuildForKey:(NSString *)key {
    @synchronized(self) {
        AWSCodeBuild *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCodeBuild
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCodeBuild registerCodeBuildWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCodeBuildForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCodeBuild` or `+ CodeBuildForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCodeBuild
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCodeBuild];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCodeBuildRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSCodeBuildResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCodeBuildResponseSerializer alloc] initWithJSONDefinition:[[AWSCodeBuildResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSCodeBuildBatchDeleteBuildsOutput *> *)batchDeleteBuilds:(AWSCodeBuildBatchDeleteBuildsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchDeleteBuilds"
                   outputClass:[AWSCodeBuildBatchDeleteBuildsOutput class]];
}

- (void)batchDeleteBuilds:(AWSCodeBuildBatchDeleteBuildsInput *)request
     completionHandler:(void (^)(AWSCodeBuildBatchDeleteBuildsOutput *response, NSError *error))completionHandler {
    [[self batchDeleteBuilds:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildBatchDeleteBuildsOutput *> * _Nonnull task) {
        AWSCodeBuildBatchDeleteBuildsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildBatchGetBuildsOutput *> *)batchGetBuilds:(AWSCodeBuildBatchGetBuildsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchGetBuilds"
                   outputClass:[AWSCodeBuildBatchGetBuildsOutput class]];
}

- (void)batchGetBuilds:(AWSCodeBuildBatchGetBuildsInput *)request
     completionHandler:(void (^)(AWSCodeBuildBatchGetBuildsOutput *response, NSError *error))completionHandler {
    [[self batchGetBuilds:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildBatchGetBuildsOutput *> * _Nonnull task) {
        AWSCodeBuildBatchGetBuildsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildBatchGetProjectsOutput *> *)batchGetProjects:(AWSCodeBuildBatchGetProjectsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchGetProjects"
                   outputClass:[AWSCodeBuildBatchGetProjectsOutput class]];
}

- (void)batchGetProjects:(AWSCodeBuildBatchGetProjectsInput *)request
     completionHandler:(void (^)(AWSCodeBuildBatchGetProjectsOutput *response, NSError *error))completionHandler {
    [[self batchGetProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildBatchGetProjectsOutput *> * _Nonnull task) {
        AWSCodeBuildBatchGetProjectsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildBatchGetReportGroupsOutput *> *)batchGetReportGroups:(AWSCodeBuildBatchGetReportGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchGetReportGroups"
                   outputClass:[AWSCodeBuildBatchGetReportGroupsOutput class]];
}

- (void)batchGetReportGroups:(AWSCodeBuildBatchGetReportGroupsInput *)request
     completionHandler:(void (^)(AWSCodeBuildBatchGetReportGroupsOutput *response, NSError *error))completionHandler {
    [[self batchGetReportGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildBatchGetReportGroupsOutput *> * _Nonnull task) {
        AWSCodeBuildBatchGetReportGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildBatchGetReportsOutput *> *)batchGetReports:(AWSCodeBuildBatchGetReportsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchGetReports"
                   outputClass:[AWSCodeBuildBatchGetReportsOutput class]];
}

- (void)batchGetReports:(AWSCodeBuildBatchGetReportsInput *)request
     completionHandler:(void (^)(AWSCodeBuildBatchGetReportsOutput *response, NSError *error))completionHandler {
    [[self batchGetReports:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildBatchGetReportsOutput *> * _Nonnull task) {
        AWSCodeBuildBatchGetReportsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildCreateProjectOutput *> *)createProject:(AWSCodeBuildCreateProjectInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"CreateProject"
                   outputClass:[AWSCodeBuildCreateProjectOutput class]];
}

- (void)createProject:(AWSCodeBuildCreateProjectInput *)request
     completionHandler:(void (^)(AWSCodeBuildCreateProjectOutput *response, NSError *error))completionHandler {
    [[self createProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildCreateProjectOutput *> * _Nonnull task) {
        AWSCodeBuildCreateProjectOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildCreateReportGroupOutput *> *)createReportGroup:(AWSCodeBuildCreateReportGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"CreateReportGroup"
                   outputClass:[AWSCodeBuildCreateReportGroupOutput class]];
}

- (void)createReportGroup:(AWSCodeBuildCreateReportGroupInput *)request
     completionHandler:(void (^)(AWSCodeBuildCreateReportGroupOutput *response, NSError *error))completionHandler {
    [[self createReportGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildCreateReportGroupOutput *> * _Nonnull task) {
        AWSCodeBuildCreateReportGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildCreateWebhookOutput *> *)createWebhook:(AWSCodeBuildCreateWebhookInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"CreateWebhook"
                   outputClass:[AWSCodeBuildCreateWebhookOutput class]];
}

- (void)createWebhook:(AWSCodeBuildCreateWebhookInput *)request
     completionHandler:(void (^)(AWSCodeBuildCreateWebhookOutput *response, NSError *error))completionHandler {
    [[self createWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildCreateWebhookOutput *> * _Nonnull task) {
        AWSCodeBuildCreateWebhookOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildDeleteProjectOutput *> *)deleteProject:(AWSCodeBuildDeleteProjectInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteProject"
                   outputClass:[AWSCodeBuildDeleteProjectOutput class]];
}

- (void)deleteProject:(AWSCodeBuildDeleteProjectInput *)request
     completionHandler:(void (^)(AWSCodeBuildDeleteProjectOutput *response, NSError *error))completionHandler {
    [[self deleteProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildDeleteProjectOutput *> * _Nonnull task) {
        AWSCodeBuildDeleteProjectOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildDeleteReportOutput *> *)deleteReport:(AWSCodeBuildDeleteReportInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteReport"
                   outputClass:[AWSCodeBuildDeleteReportOutput class]];
}

- (void)deleteReport:(AWSCodeBuildDeleteReportInput *)request
     completionHandler:(void (^)(AWSCodeBuildDeleteReportOutput *response, NSError *error))completionHandler {
    [[self deleteReport:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildDeleteReportOutput *> * _Nonnull task) {
        AWSCodeBuildDeleteReportOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildDeleteReportGroupOutput *> *)deleteReportGroup:(AWSCodeBuildDeleteReportGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteReportGroup"
                   outputClass:[AWSCodeBuildDeleteReportGroupOutput class]];
}

- (void)deleteReportGroup:(AWSCodeBuildDeleteReportGroupInput *)request
     completionHandler:(void (^)(AWSCodeBuildDeleteReportGroupOutput *response, NSError *error))completionHandler {
    [[self deleteReportGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildDeleteReportGroupOutput *> * _Nonnull task) {
        AWSCodeBuildDeleteReportGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildDeleteResourcePolicyOutput *> *)deleteResourcePolicy:(AWSCodeBuildDeleteResourcePolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteResourcePolicy"
                   outputClass:[AWSCodeBuildDeleteResourcePolicyOutput class]];
}

- (void)deleteResourcePolicy:(AWSCodeBuildDeleteResourcePolicyInput *)request
     completionHandler:(void (^)(AWSCodeBuildDeleteResourcePolicyOutput *response, NSError *error))completionHandler {
    [[self deleteResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildDeleteResourcePolicyOutput *> * _Nonnull task) {
        AWSCodeBuildDeleteResourcePolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildDeleteSourceCredentialsOutput *> *)deleteSourceCredentials:(AWSCodeBuildDeleteSourceCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteSourceCredentials"
                   outputClass:[AWSCodeBuildDeleteSourceCredentialsOutput class]];
}

- (void)deleteSourceCredentials:(AWSCodeBuildDeleteSourceCredentialsInput *)request
     completionHandler:(void (^)(AWSCodeBuildDeleteSourceCredentialsOutput *response, NSError *error))completionHandler {
    [[self deleteSourceCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildDeleteSourceCredentialsOutput *> * _Nonnull task) {
        AWSCodeBuildDeleteSourceCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildDeleteWebhookOutput *> *)deleteWebhook:(AWSCodeBuildDeleteWebhookInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteWebhook"
                   outputClass:[AWSCodeBuildDeleteWebhookOutput class]];
}

- (void)deleteWebhook:(AWSCodeBuildDeleteWebhookInput *)request
     completionHandler:(void (^)(AWSCodeBuildDeleteWebhookOutput *response, NSError *error))completionHandler {
    [[self deleteWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildDeleteWebhookOutput *> * _Nonnull task) {
        AWSCodeBuildDeleteWebhookOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildDescribeTestCasesOutput *> *)describeTestCases:(AWSCodeBuildDescribeTestCasesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DescribeTestCases"
                   outputClass:[AWSCodeBuildDescribeTestCasesOutput class]];
}

- (void)describeTestCases:(AWSCodeBuildDescribeTestCasesInput *)request
     completionHandler:(void (^)(AWSCodeBuildDescribeTestCasesOutput *response, NSError *error))completionHandler {
    [[self describeTestCases:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildDescribeTestCasesOutput *> * _Nonnull task) {
        AWSCodeBuildDescribeTestCasesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildGetResourcePolicyOutput *> *)getResourcePolicy:(AWSCodeBuildGetResourcePolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"GetResourcePolicy"
                   outputClass:[AWSCodeBuildGetResourcePolicyOutput class]];
}

- (void)getResourcePolicy:(AWSCodeBuildGetResourcePolicyInput *)request
     completionHandler:(void (^)(AWSCodeBuildGetResourcePolicyOutput *response, NSError *error))completionHandler {
    [[self getResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildGetResourcePolicyOutput *> * _Nonnull task) {
        AWSCodeBuildGetResourcePolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildImportSourceCredentialsOutput *> *)importSourceCredentials:(AWSCodeBuildImportSourceCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ImportSourceCredentials"
                   outputClass:[AWSCodeBuildImportSourceCredentialsOutput class]];
}

- (void)importSourceCredentials:(AWSCodeBuildImportSourceCredentialsInput *)request
     completionHandler:(void (^)(AWSCodeBuildImportSourceCredentialsOutput *response, NSError *error))completionHandler {
    [[self importSourceCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildImportSourceCredentialsOutput *> * _Nonnull task) {
        AWSCodeBuildImportSourceCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildInvalidateProjectCacheOutput *> *)invalidateProjectCache:(AWSCodeBuildInvalidateProjectCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"InvalidateProjectCache"
                   outputClass:[AWSCodeBuildInvalidateProjectCacheOutput class]];
}

- (void)invalidateProjectCache:(AWSCodeBuildInvalidateProjectCacheInput *)request
     completionHandler:(void (^)(AWSCodeBuildInvalidateProjectCacheOutput *response, NSError *error))completionHandler {
    [[self invalidateProjectCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildInvalidateProjectCacheOutput *> * _Nonnull task) {
        AWSCodeBuildInvalidateProjectCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListBuildsOutput *> *)listBuilds:(AWSCodeBuildListBuildsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListBuilds"
                   outputClass:[AWSCodeBuildListBuildsOutput class]];
}

- (void)listBuilds:(AWSCodeBuildListBuildsInput *)request
     completionHandler:(void (^)(AWSCodeBuildListBuildsOutput *response, NSError *error))completionHandler {
    [[self listBuilds:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListBuildsOutput *> * _Nonnull task) {
        AWSCodeBuildListBuildsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListBuildsForProjectOutput *> *)listBuildsForProject:(AWSCodeBuildListBuildsForProjectInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListBuildsForProject"
                   outputClass:[AWSCodeBuildListBuildsForProjectOutput class]];
}

- (void)listBuildsForProject:(AWSCodeBuildListBuildsForProjectInput *)request
     completionHandler:(void (^)(AWSCodeBuildListBuildsForProjectOutput *response, NSError *error))completionHandler {
    [[self listBuildsForProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListBuildsForProjectOutput *> * _Nonnull task) {
        AWSCodeBuildListBuildsForProjectOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListCuratedEnvironmentImagesOutput *> *)listCuratedEnvironmentImages:(AWSCodeBuildListCuratedEnvironmentImagesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListCuratedEnvironmentImages"
                   outputClass:[AWSCodeBuildListCuratedEnvironmentImagesOutput class]];
}

- (void)listCuratedEnvironmentImages:(AWSCodeBuildListCuratedEnvironmentImagesInput *)request
     completionHandler:(void (^)(AWSCodeBuildListCuratedEnvironmentImagesOutput *response, NSError *error))completionHandler {
    [[self listCuratedEnvironmentImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListCuratedEnvironmentImagesOutput *> * _Nonnull task) {
        AWSCodeBuildListCuratedEnvironmentImagesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListProjectsOutput *> *)listProjects:(AWSCodeBuildListProjectsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListProjects"
                   outputClass:[AWSCodeBuildListProjectsOutput class]];
}

- (void)listProjects:(AWSCodeBuildListProjectsInput *)request
     completionHandler:(void (^)(AWSCodeBuildListProjectsOutput *response, NSError *error))completionHandler {
    [[self listProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListProjectsOutput *> * _Nonnull task) {
        AWSCodeBuildListProjectsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListReportGroupsOutput *> *)listReportGroups:(AWSCodeBuildListReportGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListReportGroups"
                   outputClass:[AWSCodeBuildListReportGroupsOutput class]];
}

- (void)listReportGroups:(AWSCodeBuildListReportGroupsInput *)request
     completionHandler:(void (^)(AWSCodeBuildListReportGroupsOutput *response, NSError *error))completionHandler {
    [[self listReportGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListReportGroupsOutput *> * _Nonnull task) {
        AWSCodeBuildListReportGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListReportsOutput *> *)listReports:(AWSCodeBuildListReportsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListReports"
                   outputClass:[AWSCodeBuildListReportsOutput class]];
}

- (void)listReports:(AWSCodeBuildListReportsInput *)request
     completionHandler:(void (^)(AWSCodeBuildListReportsOutput *response, NSError *error))completionHandler {
    [[self listReports:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListReportsOutput *> * _Nonnull task) {
        AWSCodeBuildListReportsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListReportsForReportGroupOutput *> *)listReportsForReportGroup:(AWSCodeBuildListReportsForReportGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListReportsForReportGroup"
                   outputClass:[AWSCodeBuildListReportsForReportGroupOutput class]];
}

- (void)listReportsForReportGroup:(AWSCodeBuildListReportsForReportGroupInput *)request
     completionHandler:(void (^)(AWSCodeBuildListReportsForReportGroupOutput *response, NSError *error))completionHandler {
    [[self listReportsForReportGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListReportsForReportGroupOutput *> * _Nonnull task) {
        AWSCodeBuildListReportsForReportGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListSharedProjectsOutput *> *)listSharedProjects:(AWSCodeBuildListSharedProjectsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListSharedProjects"
                   outputClass:[AWSCodeBuildListSharedProjectsOutput class]];
}

- (void)listSharedProjects:(AWSCodeBuildListSharedProjectsInput *)request
     completionHandler:(void (^)(AWSCodeBuildListSharedProjectsOutput *response, NSError *error))completionHandler {
    [[self listSharedProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListSharedProjectsOutput *> * _Nonnull task) {
        AWSCodeBuildListSharedProjectsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListSharedReportGroupsOutput *> *)listSharedReportGroups:(AWSCodeBuildListSharedReportGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListSharedReportGroups"
                   outputClass:[AWSCodeBuildListSharedReportGroupsOutput class]];
}

- (void)listSharedReportGroups:(AWSCodeBuildListSharedReportGroupsInput *)request
     completionHandler:(void (^)(AWSCodeBuildListSharedReportGroupsOutput *response, NSError *error))completionHandler {
    [[self listSharedReportGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListSharedReportGroupsOutput *> * _Nonnull task) {
        AWSCodeBuildListSharedReportGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildListSourceCredentialsOutput *> *)listSourceCredentials:(AWSCodeBuildListSourceCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListSourceCredentials"
                   outputClass:[AWSCodeBuildListSourceCredentialsOutput class]];
}

- (void)listSourceCredentials:(AWSCodeBuildListSourceCredentialsInput *)request
     completionHandler:(void (^)(AWSCodeBuildListSourceCredentialsOutput *response, NSError *error))completionHandler {
    [[self listSourceCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildListSourceCredentialsOutput *> * _Nonnull task) {
        AWSCodeBuildListSourceCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildPutResourcePolicyOutput *> *)putResourcePolicy:(AWSCodeBuildPutResourcePolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"PutResourcePolicy"
                   outputClass:[AWSCodeBuildPutResourcePolicyOutput class]];
}

- (void)putResourcePolicy:(AWSCodeBuildPutResourcePolicyInput *)request
     completionHandler:(void (^)(AWSCodeBuildPutResourcePolicyOutput *response, NSError *error))completionHandler {
    [[self putResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildPutResourcePolicyOutput *> * _Nonnull task) {
        AWSCodeBuildPutResourcePolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildStartBuildOutput *> *)startBuild:(AWSCodeBuildStartBuildInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"StartBuild"
                   outputClass:[AWSCodeBuildStartBuildOutput class]];
}

- (void)startBuild:(AWSCodeBuildStartBuildInput *)request
     completionHandler:(void (^)(AWSCodeBuildStartBuildOutput *response, NSError *error))completionHandler {
    [[self startBuild:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildStartBuildOutput *> * _Nonnull task) {
        AWSCodeBuildStartBuildOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildStopBuildOutput *> *)stopBuild:(AWSCodeBuildStopBuildInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"StopBuild"
                   outputClass:[AWSCodeBuildStopBuildOutput class]];
}

- (void)stopBuild:(AWSCodeBuildStopBuildInput *)request
     completionHandler:(void (^)(AWSCodeBuildStopBuildOutput *response, NSError *error))completionHandler {
    [[self stopBuild:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildStopBuildOutput *> * _Nonnull task) {
        AWSCodeBuildStopBuildOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildUpdateProjectOutput *> *)updateProject:(AWSCodeBuildUpdateProjectInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"UpdateProject"
                   outputClass:[AWSCodeBuildUpdateProjectOutput class]];
}

- (void)updateProject:(AWSCodeBuildUpdateProjectInput *)request
     completionHandler:(void (^)(AWSCodeBuildUpdateProjectOutput *response, NSError *error))completionHandler {
    [[self updateProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildUpdateProjectOutput *> * _Nonnull task) {
        AWSCodeBuildUpdateProjectOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildUpdateReportGroupOutput *> *)updateReportGroup:(AWSCodeBuildUpdateReportGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"UpdateReportGroup"
                   outputClass:[AWSCodeBuildUpdateReportGroupOutput class]];
}

- (void)updateReportGroup:(AWSCodeBuildUpdateReportGroupInput *)request
     completionHandler:(void (^)(AWSCodeBuildUpdateReportGroupOutput *response, NSError *error))completionHandler {
    [[self updateReportGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildUpdateReportGroupOutput *> * _Nonnull task) {
        AWSCodeBuildUpdateReportGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeBuildUpdateWebhookOutput *> *)updateWebhook:(AWSCodeBuildUpdateWebhookInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"UpdateWebhook"
                   outputClass:[AWSCodeBuildUpdateWebhookOutput class]];
}

- (void)updateWebhook:(AWSCodeBuildUpdateWebhookInput *)request
     completionHandler:(void (^)(AWSCodeBuildUpdateWebhookOutput *response, NSError *error))completionHandler {
    [[self updateWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeBuildUpdateWebhookOutput *> * _Nonnull task) {
        AWSCodeBuildUpdateWebhookOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
