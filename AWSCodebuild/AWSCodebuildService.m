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

#import "AWSCodebuildService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSCodebuildResources.h"

static NSString *const AWSInfoCodebuild = @"Codebuild";
NSString *const AWSCodebuildSDKVersion = @"2.13.4";


@interface AWSCodebuildResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSCodebuildResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccountLimitExceededException" : @(AWSCodebuildErrorAccountLimitExceeded),
                            @"InvalidInputException" : @(AWSCodebuildErrorInvalidInput),
                            @"OAuthProviderException" : @(AWSCodebuildErrorOAuthProvider),
                            @"ResourceAlreadyExistsException" : @(AWSCodebuildErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSCodebuildErrorResourceNotFound),
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
	                *error = [NSError errorWithDomain:AWSCodebuildErrorDomain
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
        *error = [NSError errorWithDomain:AWSCodebuildErrorDomain
                                     code:AWSCodebuildErrorUnknown
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

@interface AWSCodebuildRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCodebuildRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCodebuild()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCodebuild

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSCodebuildSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSCodebuild versions need to match. Check your SDK installation. AWSCore: %@ AWSCodebuild: %@", AWSiOSSDKVersion, AWSCodebuildSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCodebuild {
    static AWSCodebuild *_defaultCodebuild = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCodebuild];
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
        _defaultCodebuild = [[AWSCodebuild alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCodebuild;
}

+ (void)registerCodebuildWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCodebuild alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CodebuildForKey:(NSString *)key {
    @synchronized(self) {
        AWSCodebuild *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCodebuild
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCodebuild registerCodebuildWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCodebuildForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCodebuild` or `+ CodebuildForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCodebuild
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCodebuild];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCodebuildRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSCodebuildResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCodebuildResponseSerializer alloc] initWithJSONDefinition:[[AWSCodebuildResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSCodebuildBatchDeleteBuildsOutput *> *)batchDeleteBuilds:(AWSCodebuildBatchDeleteBuildsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchDeleteBuilds"
                   outputClass:[AWSCodebuildBatchDeleteBuildsOutput class]];
}

- (void)batchDeleteBuilds:(AWSCodebuildBatchDeleteBuildsInput *)request
     completionHandler:(void (^)(AWSCodebuildBatchDeleteBuildsOutput *response, NSError *error))completionHandler {
    [[self batchDeleteBuilds:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildBatchDeleteBuildsOutput *> * _Nonnull task) {
        AWSCodebuildBatchDeleteBuildsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildBatchGetBuildsOutput *> *)batchGetBuilds:(AWSCodebuildBatchGetBuildsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchGetBuilds"
                   outputClass:[AWSCodebuildBatchGetBuildsOutput class]];
}

- (void)batchGetBuilds:(AWSCodebuildBatchGetBuildsInput *)request
     completionHandler:(void (^)(AWSCodebuildBatchGetBuildsOutput *response, NSError *error))completionHandler {
    [[self batchGetBuilds:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildBatchGetBuildsOutput *> * _Nonnull task) {
        AWSCodebuildBatchGetBuildsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildBatchGetProjectsOutput *> *)batchGetProjects:(AWSCodebuildBatchGetProjectsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchGetProjects"
                   outputClass:[AWSCodebuildBatchGetProjectsOutput class]];
}

- (void)batchGetProjects:(AWSCodebuildBatchGetProjectsInput *)request
     completionHandler:(void (^)(AWSCodebuildBatchGetProjectsOutput *response, NSError *error))completionHandler {
    [[self batchGetProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildBatchGetProjectsOutput *> * _Nonnull task) {
        AWSCodebuildBatchGetProjectsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildBatchGetReportGroupsOutput *> *)batchGetReportGroups:(AWSCodebuildBatchGetReportGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchGetReportGroups"
                   outputClass:[AWSCodebuildBatchGetReportGroupsOutput class]];
}

- (void)batchGetReportGroups:(AWSCodebuildBatchGetReportGroupsInput *)request
     completionHandler:(void (^)(AWSCodebuildBatchGetReportGroupsOutput *response, NSError *error))completionHandler {
    [[self batchGetReportGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildBatchGetReportGroupsOutput *> * _Nonnull task) {
        AWSCodebuildBatchGetReportGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildBatchGetReportsOutput *> *)batchGetReports:(AWSCodebuildBatchGetReportsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"BatchGetReports"
                   outputClass:[AWSCodebuildBatchGetReportsOutput class]];
}

- (void)batchGetReports:(AWSCodebuildBatchGetReportsInput *)request
     completionHandler:(void (^)(AWSCodebuildBatchGetReportsOutput *response, NSError *error))completionHandler {
    [[self batchGetReports:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildBatchGetReportsOutput *> * _Nonnull task) {
        AWSCodebuildBatchGetReportsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildCreateProjectOutput *> *)createProject:(AWSCodebuildCreateProjectInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"CreateProject"
                   outputClass:[AWSCodebuildCreateProjectOutput class]];
}

- (void)createProject:(AWSCodebuildCreateProjectInput *)request
     completionHandler:(void (^)(AWSCodebuildCreateProjectOutput *response, NSError *error))completionHandler {
    [[self createProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildCreateProjectOutput *> * _Nonnull task) {
        AWSCodebuildCreateProjectOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildCreateReportGroupOutput *> *)createReportGroup:(AWSCodebuildCreateReportGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"CreateReportGroup"
                   outputClass:[AWSCodebuildCreateReportGroupOutput class]];
}

- (void)createReportGroup:(AWSCodebuildCreateReportGroupInput *)request
     completionHandler:(void (^)(AWSCodebuildCreateReportGroupOutput *response, NSError *error))completionHandler {
    [[self createReportGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildCreateReportGroupOutput *> * _Nonnull task) {
        AWSCodebuildCreateReportGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildCreateWebhookOutput *> *)createWebhook:(AWSCodebuildCreateWebhookInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"CreateWebhook"
                   outputClass:[AWSCodebuildCreateWebhookOutput class]];
}

- (void)createWebhook:(AWSCodebuildCreateWebhookInput *)request
     completionHandler:(void (^)(AWSCodebuildCreateWebhookOutput *response, NSError *error))completionHandler {
    [[self createWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildCreateWebhookOutput *> * _Nonnull task) {
        AWSCodebuildCreateWebhookOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildDeleteProjectOutput *> *)deleteProject:(AWSCodebuildDeleteProjectInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteProject"
                   outputClass:[AWSCodebuildDeleteProjectOutput class]];
}

- (void)deleteProject:(AWSCodebuildDeleteProjectInput *)request
     completionHandler:(void (^)(AWSCodebuildDeleteProjectOutput *response, NSError *error))completionHandler {
    [[self deleteProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildDeleteProjectOutput *> * _Nonnull task) {
        AWSCodebuildDeleteProjectOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildDeleteReportOutput *> *)deleteReport:(AWSCodebuildDeleteReportInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteReport"
                   outputClass:[AWSCodebuildDeleteReportOutput class]];
}

- (void)deleteReport:(AWSCodebuildDeleteReportInput *)request
     completionHandler:(void (^)(AWSCodebuildDeleteReportOutput *response, NSError *error))completionHandler {
    [[self deleteReport:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildDeleteReportOutput *> * _Nonnull task) {
        AWSCodebuildDeleteReportOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildDeleteReportGroupOutput *> *)deleteReportGroup:(AWSCodebuildDeleteReportGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteReportGroup"
                   outputClass:[AWSCodebuildDeleteReportGroupOutput class]];
}

- (void)deleteReportGroup:(AWSCodebuildDeleteReportGroupInput *)request
     completionHandler:(void (^)(AWSCodebuildDeleteReportGroupOutput *response, NSError *error))completionHandler {
    [[self deleteReportGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildDeleteReportGroupOutput *> * _Nonnull task) {
        AWSCodebuildDeleteReportGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildDeleteResourcePolicyOutput *> *)deleteResourcePolicy:(AWSCodebuildDeleteResourcePolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteResourcePolicy"
                   outputClass:[AWSCodebuildDeleteResourcePolicyOutput class]];
}

- (void)deleteResourcePolicy:(AWSCodebuildDeleteResourcePolicyInput *)request
     completionHandler:(void (^)(AWSCodebuildDeleteResourcePolicyOutput *response, NSError *error))completionHandler {
    [[self deleteResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildDeleteResourcePolicyOutput *> * _Nonnull task) {
        AWSCodebuildDeleteResourcePolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildDeleteSourceCredentialsOutput *> *)deleteSourceCredentials:(AWSCodebuildDeleteSourceCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteSourceCredentials"
                   outputClass:[AWSCodebuildDeleteSourceCredentialsOutput class]];
}

- (void)deleteSourceCredentials:(AWSCodebuildDeleteSourceCredentialsInput *)request
     completionHandler:(void (^)(AWSCodebuildDeleteSourceCredentialsOutput *response, NSError *error))completionHandler {
    [[self deleteSourceCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildDeleteSourceCredentialsOutput *> * _Nonnull task) {
        AWSCodebuildDeleteSourceCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildDeleteWebhookOutput *> *)deleteWebhook:(AWSCodebuildDeleteWebhookInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DeleteWebhook"
                   outputClass:[AWSCodebuildDeleteWebhookOutput class]];
}

- (void)deleteWebhook:(AWSCodebuildDeleteWebhookInput *)request
     completionHandler:(void (^)(AWSCodebuildDeleteWebhookOutput *response, NSError *error))completionHandler {
    [[self deleteWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildDeleteWebhookOutput *> * _Nonnull task) {
        AWSCodebuildDeleteWebhookOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildDescribeTestCasesOutput *> *)describeTestCases:(AWSCodebuildDescribeTestCasesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"DescribeTestCases"
                   outputClass:[AWSCodebuildDescribeTestCasesOutput class]];
}

- (void)describeTestCases:(AWSCodebuildDescribeTestCasesInput *)request
     completionHandler:(void (^)(AWSCodebuildDescribeTestCasesOutput *response, NSError *error))completionHandler {
    [[self describeTestCases:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildDescribeTestCasesOutput *> * _Nonnull task) {
        AWSCodebuildDescribeTestCasesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildGetResourcePolicyOutput *> *)getResourcePolicy:(AWSCodebuildGetResourcePolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"GetResourcePolicy"
                   outputClass:[AWSCodebuildGetResourcePolicyOutput class]];
}

- (void)getResourcePolicy:(AWSCodebuildGetResourcePolicyInput *)request
     completionHandler:(void (^)(AWSCodebuildGetResourcePolicyOutput *response, NSError *error))completionHandler {
    [[self getResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildGetResourcePolicyOutput *> * _Nonnull task) {
        AWSCodebuildGetResourcePolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildImportSourceCredentialsOutput *> *)importSourceCredentials:(AWSCodebuildImportSourceCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ImportSourceCredentials"
                   outputClass:[AWSCodebuildImportSourceCredentialsOutput class]];
}

- (void)importSourceCredentials:(AWSCodebuildImportSourceCredentialsInput *)request
     completionHandler:(void (^)(AWSCodebuildImportSourceCredentialsOutput *response, NSError *error))completionHandler {
    [[self importSourceCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildImportSourceCredentialsOutput *> * _Nonnull task) {
        AWSCodebuildImportSourceCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildInvalidateProjectCacheOutput *> *)invalidateProjectCache:(AWSCodebuildInvalidateProjectCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"InvalidateProjectCache"
                   outputClass:[AWSCodebuildInvalidateProjectCacheOutput class]];
}

- (void)invalidateProjectCache:(AWSCodebuildInvalidateProjectCacheInput *)request
     completionHandler:(void (^)(AWSCodebuildInvalidateProjectCacheOutput *response, NSError *error))completionHandler {
    [[self invalidateProjectCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildInvalidateProjectCacheOutput *> * _Nonnull task) {
        AWSCodebuildInvalidateProjectCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListBuildsOutput *> *)listBuilds:(AWSCodebuildListBuildsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListBuilds"
                   outputClass:[AWSCodebuildListBuildsOutput class]];
}

- (void)listBuilds:(AWSCodebuildListBuildsInput *)request
     completionHandler:(void (^)(AWSCodebuildListBuildsOutput *response, NSError *error))completionHandler {
    [[self listBuilds:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListBuildsOutput *> * _Nonnull task) {
        AWSCodebuildListBuildsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListBuildsForProjectOutput *> *)listBuildsForProject:(AWSCodebuildListBuildsForProjectInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListBuildsForProject"
                   outputClass:[AWSCodebuildListBuildsForProjectOutput class]];
}

- (void)listBuildsForProject:(AWSCodebuildListBuildsForProjectInput *)request
     completionHandler:(void (^)(AWSCodebuildListBuildsForProjectOutput *response, NSError *error))completionHandler {
    [[self listBuildsForProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListBuildsForProjectOutput *> * _Nonnull task) {
        AWSCodebuildListBuildsForProjectOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListCuratedEnvironmentImagesOutput *> *)listCuratedEnvironmentImages:(AWSCodebuildListCuratedEnvironmentImagesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListCuratedEnvironmentImages"
                   outputClass:[AWSCodebuildListCuratedEnvironmentImagesOutput class]];
}

- (void)listCuratedEnvironmentImages:(AWSCodebuildListCuratedEnvironmentImagesInput *)request
     completionHandler:(void (^)(AWSCodebuildListCuratedEnvironmentImagesOutput *response, NSError *error))completionHandler {
    [[self listCuratedEnvironmentImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListCuratedEnvironmentImagesOutput *> * _Nonnull task) {
        AWSCodebuildListCuratedEnvironmentImagesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListProjectsOutput *> *)listProjects:(AWSCodebuildListProjectsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListProjects"
                   outputClass:[AWSCodebuildListProjectsOutput class]];
}

- (void)listProjects:(AWSCodebuildListProjectsInput *)request
     completionHandler:(void (^)(AWSCodebuildListProjectsOutput *response, NSError *error))completionHandler {
    [[self listProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListProjectsOutput *> * _Nonnull task) {
        AWSCodebuildListProjectsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListReportGroupsOutput *> *)listReportGroups:(AWSCodebuildListReportGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListReportGroups"
                   outputClass:[AWSCodebuildListReportGroupsOutput class]];
}

- (void)listReportGroups:(AWSCodebuildListReportGroupsInput *)request
     completionHandler:(void (^)(AWSCodebuildListReportGroupsOutput *response, NSError *error))completionHandler {
    [[self listReportGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListReportGroupsOutput *> * _Nonnull task) {
        AWSCodebuildListReportGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListReportsOutput *> *)listReports:(AWSCodebuildListReportsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListReports"
                   outputClass:[AWSCodebuildListReportsOutput class]];
}

- (void)listReports:(AWSCodebuildListReportsInput *)request
     completionHandler:(void (^)(AWSCodebuildListReportsOutput *response, NSError *error))completionHandler {
    [[self listReports:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListReportsOutput *> * _Nonnull task) {
        AWSCodebuildListReportsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListReportsForReportGroupOutput *> *)listReportsForReportGroup:(AWSCodebuildListReportsForReportGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListReportsForReportGroup"
                   outputClass:[AWSCodebuildListReportsForReportGroupOutput class]];
}

- (void)listReportsForReportGroup:(AWSCodebuildListReportsForReportGroupInput *)request
     completionHandler:(void (^)(AWSCodebuildListReportsForReportGroupOutput *response, NSError *error))completionHandler {
    [[self listReportsForReportGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListReportsForReportGroupOutput *> * _Nonnull task) {
        AWSCodebuildListReportsForReportGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListSharedProjectsOutput *> *)listSharedProjects:(AWSCodebuildListSharedProjectsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListSharedProjects"
                   outputClass:[AWSCodebuildListSharedProjectsOutput class]];
}

- (void)listSharedProjects:(AWSCodebuildListSharedProjectsInput *)request
     completionHandler:(void (^)(AWSCodebuildListSharedProjectsOutput *response, NSError *error))completionHandler {
    [[self listSharedProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListSharedProjectsOutput *> * _Nonnull task) {
        AWSCodebuildListSharedProjectsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListSharedReportGroupsOutput *> *)listSharedReportGroups:(AWSCodebuildListSharedReportGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListSharedReportGroups"
                   outputClass:[AWSCodebuildListSharedReportGroupsOutput class]];
}

- (void)listSharedReportGroups:(AWSCodebuildListSharedReportGroupsInput *)request
     completionHandler:(void (^)(AWSCodebuildListSharedReportGroupsOutput *response, NSError *error))completionHandler {
    [[self listSharedReportGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListSharedReportGroupsOutput *> * _Nonnull task) {
        AWSCodebuildListSharedReportGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildListSourceCredentialsOutput *> *)listSourceCredentials:(AWSCodebuildListSourceCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"ListSourceCredentials"
                   outputClass:[AWSCodebuildListSourceCredentialsOutput class]];
}

- (void)listSourceCredentials:(AWSCodebuildListSourceCredentialsInput *)request
     completionHandler:(void (^)(AWSCodebuildListSourceCredentialsOutput *response, NSError *error))completionHandler {
    [[self listSourceCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildListSourceCredentialsOutput *> * _Nonnull task) {
        AWSCodebuildListSourceCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildPutResourcePolicyOutput *> *)putResourcePolicy:(AWSCodebuildPutResourcePolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"PutResourcePolicy"
                   outputClass:[AWSCodebuildPutResourcePolicyOutput class]];
}

- (void)putResourcePolicy:(AWSCodebuildPutResourcePolicyInput *)request
     completionHandler:(void (^)(AWSCodebuildPutResourcePolicyOutput *response, NSError *error))completionHandler {
    [[self putResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildPutResourcePolicyOutput *> * _Nonnull task) {
        AWSCodebuildPutResourcePolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildStartBuildOutput *> *)startBuild:(AWSCodebuildStartBuildInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"StartBuild"
                   outputClass:[AWSCodebuildStartBuildOutput class]];
}

- (void)startBuild:(AWSCodebuildStartBuildInput *)request
     completionHandler:(void (^)(AWSCodebuildStartBuildOutput *response, NSError *error))completionHandler {
    [[self startBuild:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildStartBuildOutput *> * _Nonnull task) {
        AWSCodebuildStartBuildOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildStopBuildOutput *> *)stopBuild:(AWSCodebuildStopBuildInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"StopBuild"
                   outputClass:[AWSCodebuildStopBuildOutput class]];
}

- (void)stopBuild:(AWSCodebuildStopBuildInput *)request
     completionHandler:(void (^)(AWSCodebuildStopBuildOutput *response, NSError *error))completionHandler {
    [[self stopBuild:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildStopBuildOutput *> * _Nonnull task) {
        AWSCodebuildStopBuildOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildUpdateProjectOutput *> *)updateProject:(AWSCodebuildUpdateProjectInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"UpdateProject"
                   outputClass:[AWSCodebuildUpdateProjectOutput class]];
}

- (void)updateProject:(AWSCodebuildUpdateProjectInput *)request
     completionHandler:(void (^)(AWSCodebuildUpdateProjectOutput *response, NSError *error))completionHandler {
    [[self updateProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildUpdateProjectOutput *> * _Nonnull task) {
        AWSCodebuildUpdateProjectOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildUpdateReportGroupOutput *> *)updateReportGroup:(AWSCodebuildUpdateReportGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"UpdateReportGroup"
                   outputClass:[AWSCodebuildUpdateReportGroupOutput class]];
}

- (void)updateReportGroup:(AWSCodebuildUpdateReportGroupInput *)request
     completionHandler:(void (^)(AWSCodebuildUpdateReportGroupOutput *response, NSError *error))completionHandler {
    [[self updateReportGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildUpdateReportGroupOutput *> * _Nonnull task) {
        AWSCodebuildUpdateReportGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodebuildUpdateWebhookOutput *> *)updateWebhook:(AWSCodebuildUpdateWebhookInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeBuild_20161006"
                 operationName:@"UpdateWebhook"
                   outputClass:[AWSCodebuildUpdateWebhookOutput class]];
}

- (void)updateWebhook:(AWSCodebuildUpdateWebhookInput *)request
     completionHandler:(void (^)(AWSCodebuildUpdateWebhookOutput *response, NSError *error))completionHandler {
    [[self updateWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodebuildUpdateWebhookOutput *> * _Nonnull task) {
        AWSCodebuildUpdateWebhookOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
