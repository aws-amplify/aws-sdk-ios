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

#import "AWSCloudformationService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSCloudformationResources.h"

static NSString *const AWSInfoCloudformation = @"Cloudformation";
NSString *const AWSCloudformationSDKVersion = @"2.13.3";


@interface AWSCloudformationResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSCloudformationResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlreadyExistsException" : @(AWSCloudformationErrorAlreadyExists),
                            @"CFNRegistryException" : @(AWSCloudformationErrorCFNRegistry),
                            @"ChangeSetNotFound" : @(AWSCloudformationErrorChangeSetNotFound),
                            @"CreatedButModifiedException" : @(AWSCloudformationErrorCreatedButModified),
                            @"InsufficientCapabilitiesException" : @(AWSCloudformationErrorInsufficientCapabilities),
                            @"InvalidChangeSetStatus" : @(AWSCloudformationErrorInvalidChangeSetStatus),
                            @"InvalidOperationException" : @(AWSCloudformationErrorInvalidOperation),
                            @"InvalidStateTransition" : @(AWSCloudformationErrorInvalidStateTransition),
                            @"LimitExceededException" : @(AWSCloudformationErrorLimitExceeded),
                            @"NameAlreadyExistsException" : @(AWSCloudformationErrorNameAlreadyExists),
                            @"OperationIdAlreadyExistsException" : @(AWSCloudformationErrorOperationIdAlreadyExists),
                            @"OperationInProgressException" : @(AWSCloudformationErrorOperationInProgress),
                            @"OperationNotFoundException" : @(AWSCloudformationErrorOperationNotFound),
                            @"ConditionalCheckFailed" : @(AWSCloudformationErrorOperationStatusCheckFailed),
                            @"StackInstanceNotFoundException" : @(AWSCloudformationErrorStackInstanceNotFound),
                            @"StackSetNotEmptyException" : @(AWSCloudformationErrorStackSetNotEmpty),
                            @"StackSetNotFoundException" : @(AWSCloudformationErrorStackSetNotFound),
                            @"StaleRequestException" : @(AWSCloudformationErrorStaleRequest),
                            @"TokenAlreadyExistsException" : @(AWSCloudformationErrorTokenAlreadyExists),
                            @"TypeNotFoundException" : @(AWSCloudformationErrorTypeNotFound),
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
                *error = [NSError errorWithDomain:AWSCloudformationErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                         ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSCloudformationErrorDomain
                                             code:AWSCloudformationErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSCloudformationErrorDomain
                                     code:AWSCloudformationErrorUnknown
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

@interface AWSCloudformationRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCloudformationRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCloudformation()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCloudformation

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSCloudformationSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSCloudformation versions need to match. Check your SDK installation. AWSCore: %@ AWSCloudformation: %@", AWSiOSSDKVersion, AWSCloudformationSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCloudformation {
    static AWSCloudformation *_defaultCloudformation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCloudformation];
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
        _defaultCloudformation = [[AWSCloudformation alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCloudformation;
}

+ (void)registerCloudformationWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCloudformation alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CloudformationForKey:(NSString *)key {
    @synchronized(self) {
        AWSCloudformation *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCloudformation
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCloudformation registerCloudformationWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCloudformationForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCloudformation` or `+ CloudformationForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCloudformation
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCloudformation];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCloudformationRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSCloudformationResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCloudformationResponseSerializer alloc] initWithJSONDefinition:[[AWSCloudformationResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)cancelUpdateStack:(AWSCloudformationCancelUpdateStackInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelUpdateStack"
                   outputClass:nil];
}

- (void)cancelUpdateStack:(AWSCloudformationCancelUpdateStackInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self cancelUpdateStack:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationContinueUpdateRollbackOutput *> *)continueUpdateRollback:(AWSCloudformationContinueUpdateRollbackInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ContinueUpdateRollback"
                   outputClass:[AWSCloudformationContinueUpdateRollbackOutput class]];
}

- (void)continueUpdateRollback:(AWSCloudformationContinueUpdateRollbackInput *)request
     completionHandler:(void (^)(AWSCloudformationContinueUpdateRollbackOutput *response, NSError *error))completionHandler {
    [[self continueUpdateRollback:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationContinueUpdateRollbackOutput *> * _Nonnull task) {
        AWSCloudformationContinueUpdateRollbackOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationCreateChangeSetOutput *> *)createChangeSet:(AWSCloudformationCreateChangeSetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateChangeSet"
                   outputClass:[AWSCloudformationCreateChangeSetOutput class]];
}

- (void)createChangeSet:(AWSCloudformationCreateChangeSetInput *)request
     completionHandler:(void (^)(AWSCloudformationCreateChangeSetOutput *response, NSError *error))completionHandler {
    [[self createChangeSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationCreateChangeSetOutput *> * _Nonnull task) {
        AWSCloudformationCreateChangeSetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationCreateStackOutput *> *)createStack:(AWSCloudformationCreateStackInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateStack"
                   outputClass:[AWSCloudformationCreateStackOutput class]];
}

- (void)createStack:(AWSCloudformationCreateStackInput *)request
     completionHandler:(void (^)(AWSCloudformationCreateStackOutput *response, NSError *error))completionHandler {
    [[self createStack:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationCreateStackOutput *> * _Nonnull task) {
        AWSCloudformationCreateStackOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationCreateStackInstancesOutput *> *)createStackInstances:(AWSCloudformationCreateStackInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateStackInstances"
                   outputClass:[AWSCloudformationCreateStackInstancesOutput class]];
}

- (void)createStackInstances:(AWSCloudformationCreateStackInstancesInput *)request
     completionHandler:(void (^)(AWSCloudformationCreateStackInstancesOutput *response, NSError *error))completionHandler {
    [[self createStackInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationCreateStackInstancesOutput *> * _Nonnull task) {
        AWSCloudformationCreateStackInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationCreateStackSetOutput *> *)createStackSet:(AWSCloudformationCreateStackSetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateStackSet"
                   outputClass:[AWSCloudformationCreateStackSetOutput class]];
}

- (void)createStackSet:(AWSCloudformationCreateStackSetInput *)request
     completionHandler:(void (^)(AWSCloudformationCreateStackSetOutput *response, NSError *error))completionHandler {
    [[self createStackSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationCreateStackSetOutput *> * _Nonnull task) {
        AWSCloudformationCreateStackSetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDeleteChangeSetOutput *> *)deleteChangeSet:(AWSCloudformationDeleteChangeSetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteChangeSet"
                   outputClass:[AWSCloudformationDeleteChangeSetOutput class]];
}

- (void)deleteChangeSet:(AWSCloudformationDeleteChangeSetInput *)request
     completionHandler:(void (^)(AWSCloudformationDeleteChangeSetOutput *response, NSError *error))completionHandler {
    [[self deleteChangeSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDeleteChangeSetOutput *> * _Nonnull task) {
        AWSCloudformationDeleteChangeSetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteStack:(AWSCloudformationDeleteStackInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteStack"
                   outputClass:nil];
}

- (void)deleteStack:(AWSCloudformationDeleteStackInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteStack:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDeleteStackInstancesOutput *> *)deleteStackInstances:(AWSCloudformationDeleteStackInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteStackInstances"
                   outputClass:[AWSCloudformationDeleteStackInstancesOutput class]];
}

- (void)deleteStackInstances:(AWSCloudformationDeleteStackInstancesInput *)request
     completionHandler:(void (^)(AWSCloudformationDeleteStackInstancesOutput *response, NSError *error))completionHandler {
    [[self deleteStackInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDeleteStackInstancesOutput *> * _Nonnull task) {
        AWSCloudformationDeleteStackInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDeleteStackSetOutput *> *)deleteStackSet:(AWSCloudformationDeleteStackSetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteStackSet"
                   outputClass:[AWSCloudformationDeleteStackSetOutput class]];
}

- (void)deleteStackSet:(AWSCloudformationDeleteStackSetInput *)request
     completionHandler:(void (^)(AWSCloudformationDeleteStackSetOutput *response, NSError *error))completionHandler {
    [[self deleteStackSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDeleteStackSetOutput *> * _Nonnull task) {
        AWSCloudformationDeleteStackSetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDeregisterTypeOutput *> *)deregisterType:(AWSCloudformationDeregisterTypeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterType"
                   outputClass:[AWSCloudformationDeregisterTypeOutput class]];
}

- (void)deregisterType:(AWSCloudformationDeregisterTypeInput *)request
     completionHandler:(void (^)(AWSCloudformationDeregisterTypeOutput *response, NSError *error))completionHandler {
    [[self deregisterType:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDeregisterTypeOutput *> * _Nonnull task) {
        AWSCloudformationDeregisterTypeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeAccountLimitsOutput *> *)describeAccountLimits:(AWSCloudformationDescribeAccountLimitsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountLimits"
                   outputClass:[AWSCloudformationDescribeAccountLimitsOutput class]];
}

- (void)describeAccountLimits:(AWSCloudformationDescribeAccountLimitsInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeAccountLimitsOutput *response, NSError *error))completionHandler {
    [[self describeAccountLimits:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeAccountLimitsOutput *> * _Nonnull task) {
        AWSCloudformationDescribeAccountLimitsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeChangeSetOutput *> *)describeChangeSet:(AWSCloudformationDescribeChangeSetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeChangeSet"
                   outputClass:[AWSCloudformationDescribeChangeSetOutput class]];
}

- (void)describeChangeSet:(AWSCloudformationDescribeChangeSetInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeChangeSetOutput *response, NSError *error))completionHandler {
    [[self describeChangeSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeChangeSetOutput *> * _Nonnull task) {
        AWSCloudformationDescribeChangeSetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeStackDriftDetectionStatusOutput *> *)describeStackDriftDetectionStatus:(AWSCloudformationDescribeStackDriftDetectionStatusInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStackDriftDetectionStatus"
                   outputClass:[AWSCloudformationDescribeStackDriftDetectionStatusOutput class]];
}

- (void)describeStackDriftDetectionStatus:(AWSCloudformationDescribeStackDriftDetectionStatusInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeStackDriftDetectionStatusOutput *response, NSError *error))completionHandler {
    [[self describeStackDriftDetectionStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeStackDriftDetectionStatusOutput *> * _Nonnull task) {
        AWSCloudformationDescribeStackDriftDetectionStatusOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeStackEventsOutput *> *)describeStackEvents:(AWSCloudformationDescribeStackEventsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStackEvents"
                   outputClass:[AWSCloudformationDescribeStackEventsOutput class]];
}

- (void)describeStackEvents:(AWSCloudformationDescribeStackEventsInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeStackEventsOutput *response, NSError *error))completionHandler {
    [[self describeStackEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeStackEventsOutput *> * _Nonnull task) {
        AWSCloudformationDescribeStackEventsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeStackInstanceOutput *> *)describeStackInstance:(AWSCloudformationDescribeStackInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStackInstance"
                   outputClass:[AWSCloudformationDescribeStackInstanceOutput class]];
}

- (void)describeStackInstance:(AWSCloudformationDescribeStackInstanceInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeStackInstanceOutput *response, NSError *error))completionHandler {
    [[self describeStackInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeStackInstanceOutput *> * _Nonnull task) {
        AWSCloudformationDescribeStackInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeStackResourceOutput *> *)describeStackResource:(AWSCloudformationDescribeStackResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStackResource"
                   outputClass:[AWSCloudformationDescribeStackResourceOutput class]];
}

- (void)describeStackResource:(AWSCloudformationDescribeStackResourceInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeStackResourceOutput *response, NSError *error))completionHandler {
    [[self describeStackResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeStackResourceOutput *> * _Nonnull task) {
        AWSCloudformationDescribeStackResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeStackResourceDriftsOutput *> *)describeStackResourceDrifts:(AWSCloudformationDescribeStackResourceDriftsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStackResourceDrifts"
                   outputClass:[AWSCloudformationDescribeStackResourceDriftsOutput class]];
}

- (void)describeStackResourceDrifts:(AWSCloudformationDescribeStackResourceDriftsInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeStackResourceDriftsOutput *response, NSError *error))completionHandler {
    [[self describeStackResourceDrifts:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeStackResourceDriftsOutput *> * _Nonnull task) {
        AWSCloudformationDescribeStackResourceDriftsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeStackResourcesOutput *> *)describeStackResources:(AWSCloudformationDescribeStackResourcesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStackResources"
                   outputClass:[AWSCloudformationDescribeStackResourcesOutput class]];
}

- (void)describeStackResources:(AWSCloudformationDescribeStackResourcesInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeStackResourcesOutput *response, NSError *error))completionHandler {
    [[self describeStackResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeStackResourcesOutput *> * _Nonnull task) {
        AWSCloudformationDescribeStackResourcesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeStackSetOutput *> *)describeStackSet:(AWSCloudformationDescribeStackSetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStackSet"
                   outputClass:[AWSCloudformationDescribeStackSetOutput class]];
}

- (void)describeStackSet:(AWSCloudformationDescribeStackSetInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeStackSetOutput *response, NSError *error))completionHandler {
    [[self describeStackSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeStackSetOutput *> * _Nonnull task) {
        AWSCloudformationDescribeStackSetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeStackSetOperationOutput *> *)describeStackSetOperation:(AWSCloudformationDescribeStackSetOperationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStackSetOperation"
                   outputClass:[AWSCloudformationDescribeStackSetOperationOutput class]];
}

- (void)describeStackSetOperation:(AWSCloudformationDescribeStackSetOperationInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeStackSetOperationOutput *response, NSError *error))completionHandler {
    [[self describeStackSetOperation:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeStackSetOperationOutput *> * _Nonnull task) {
        AWSCloudformationDescribeStackSetOperationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeStacksOutput *> *)describeStacks:(AWSCloudformationDescribeStacksInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStacks"
                   outputClass:[AWSCloudformationDescribeStacksOutput class]];
}

- (void)describeStacks:(AWSCloudformationDescribeStacksInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeStacksOutput *response, NSError *error))completionHandler {
    [[self describeStacks:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeStacksOutput *> * _Nonnull task) {
        AWSCloudformationDescribeStacksOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeTypeOutput *> *)describeType:(AWSCloudformationDescribeTypeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeType"
                   outputClass:[AWSCloudformationDescribeTypeOutput class]];
}

- (void)describeType:(AWSCloudformationDescribeTypeInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeTypeOutput *response, NSError *error))completionHandler {
    [[self describeType:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeTypeOutput *> * _Nonnull task) {
        AWSCloudformationDescribeTypeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDescribeTypeRegistrationOutput *> *)describeTypeRegistration:(AWSCloudformationDescribeTypeRegistrationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTypeRegistration"
                   outputClass:[AWSCloudformationDescribeTypeRegistrationOutput class]];
}

- (void)describeTypeRegistration:(AWSCloudformationDescribeTypeRegistrationInput *)request
     completionHandler:(void (^)(AWSCloudformationDescribeTypeRegistrationOutput *response, NSError *error))completionHandler {
    [[self describeTypeRegistration:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDescribeTypeRegistrationOutput *> * _Nonnull task) {
        AWSCloudformationDescribeTypeRegistrationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDetectStackDriftOutput *> *)detectStackDrift:(AWSCloudformationDetectStackDriftInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetectStackDrift"
                   outputClass:[AWSCloudformationDetectStackDriftOutput class]];
}

- (void)detectStackDrift:(AWSCloudformationDetectStackDriftInput *)request
     completionHandler:(void (^)(AWSCloudformationDetectStackDriftOutput *response, NSError *error))completionHandler {
    [[self detectStackDrift:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDetectStackDriftOutput *> * _Nonnull task) {
        AWSCloudformationDetectStackDriftOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDetectStackResourceDriftOutput *> *)detectStackResourceDrift:(AWSCloudformationDetectStackResourceDriftInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetectStackResourceDrift"
                   outputClass:[AWSCloudformationDetectStackResourceDriftOutput class]];
}

- (void)detectStackResourceDrift:(AWSCloudformationDetectStackResourceDriftInput *)request
     completionHandler:(void (^)(AWSCloudformationDetectStackResourceDriftOutput *response, NSError *error))completionHandler {
    [[self detectStackResourceDrift:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDetectStackResourceDriftOutput *> * _Nonnull task) {
        AWSCloudformationDetectStackResourceDriftOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationDetectStackSetDriftOutput *> *)detectStackSetDrift:(AWSCloudformationDetectStackSetDriftInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetectStackSetDrift"
                   outputClass:[AWSCloudformationDetectStackSetDriftOutput class]];
}

- (void)detectStackSetDrift:(AWSCloudformationDetectStackSetDriftInput *)request
     completionHandler:(void (^)(AWSCloudformationDetectStackSetDriftOutput *response, NSError *error))completionHandler {
    [[self detectStackSetDrift:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationDetectStackSetDriftOutput *> * _Nonnull task) {
        AWSCloudformationDetectStackSetDriftOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationEstimateTemplateCostOutput *> *)estimateTemplateCost:(AWSCloudformationEstimateTemplateCostInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EstimateTemplateCost"
                   outputClass:[AWSCloudformationEstimateTemplateCostOutput class]];
}

- (void)estimateTemplateCost:(AWSCloudformationEstimateTemplateCostInput *)request
     completionHandler:(void (^)(AWSCloudformationEstimateTemplateCostOutput *response, NSError *error))completionHandler {
    [[self estimateTemplateCost:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationEstimateTemplateCostOutput *> * _Nonnull task) {
        AWSCloudformationEstimateTemplateCostOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationExecuteChangeSetOutput *> *)executeChangeSet:(AWSCloudformationExecuteChangeSetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExecuteChangeSet"
                   outputClass:[AWSCloudformationExecuteChangeSetOutput class]];
}

- (void)executeChangeSet:(AWSCloudformationExecuteChangeSetInput *)request
     completionHandler:(void (^)(AWSCloudformationExecuteChangeSetOutput *response, NSError *error))completionHandler {
    [[self executeChangeSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationExecuteChangeSetOutput *> * _Nonnull task) {
        AWSCloudformationExecuteChangeSetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationGetStackPolicyOutput *> *)getStackPolicy:(AWSCloudformationGetStackPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetStackPolicy"
                   outputClass:[AWSCloudformationGetStackPolicyOutput class]];
}

- (void)getStackPolicy:(AWSCloudformationGetStackPolicyInput *)request
     completionHandler:(void (^)(AWSCloudformationGetStackPolicyOutput *response, NSError *error))completionHandler {
    [[self getStackPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationGetStackPolicyOutput *> * _Nonnull task) {
        AWSCloudformationGetStackPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationGetTemplateOutput *> *)getTemplate:(AWSCloudformationGetTemplateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTemplate"
                   outputClass:[AWSCloudformationGetTemplateOutput class]];
}

- (void)getTemplate:(AWSCloudformationGetTemplateInput *)request
     completionHandler:(void (^)(AWSCloudformationGetTemplateOutput *response, NSError *error))completionHandler {
    [[self getTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationGetTemplateOutput *> * _Nonnull task) {
        AWSCloudformationGetTemplateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationGetTemplateSummaryOutput *> *)getTemplateSummary:(AWSCloudformationGetTemplateSummaryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTemplateSummary"
                   outputClass:[AWSCloudformationGetTemplateSummaryOutput class]];
}

- (void)getTemplateSummary:(AWSCloudformationGetTemplateSummaryInput *)request
     completionHandler:(void (^)(AWSCloudformationGetTemplateSummaryOutput *response, NSError *error))completionHandler {
    [[self getTemplateSummary:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationGetTemplateSummaryOutput *> * _Nonnull task) {
        AWSCloudformationGetTemplateSummaryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListChangeSetsOutput *> *)listChangeSets:(AWSCloudformationListChangeSetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListChangeSets"
                   outputClass:[AWSCloudformationListChangeSetsOutput class]];
}

- (void)listChangeSets:(AWSCloudformationListChangeSetsInput *)request
     completionHandler:(void (^)(AWSCloudformationListChangeSetsOutput *response, NSError *error))completionHandler {
    [[self listChangeSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListChangeSetsOutput *> * _Nonnull task) {
        AWSCloudformationListChangeSetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListExportsOutput *> *)listExports:(AWSCloudformationListExportsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListExports"
                   outputClass:[AWSCloudformationListExportsOutput class]];
}

- (void)listExports:(AWSCloudformationListExportsInput *)request
     completionHandler:(void (^)(AWSCloudformationListExportsOutput *response, NSError *error))completionHandler {
    [[self listExports:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListExportsOutput *> * _Nonnull task) {
        AWSCloudformationListExportsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListImportsOutput *> *)listImports:(AWSCloudformationListImportsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListImports"
                   outputClass:[AWSCloudformationListImportsOutput class]];
}

- (void)listImports:(AWSCloudformationListImportsInput *)request
     completionHandler:(void (^)(AWSCloudformationListImportsOutput *response, NSError *error))completionHandler {
    [[self listImports:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListImportsOutput *> * _Nonnull task) {
        AWSCloudformationListImportsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListStackInstancesOutput *> *)listStackInstances:(AWSCloudformationListStackInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListStackInstances"
                   outputClass:[AWSCloudformationListStackInstancesOutput class]];
}

- (void)listStackInstances:(AWSCloudformationListStackInstancesInput *)request
     completionHandler:(void (^)(AWSCloudformationListStackInstancesOutput *response, NSError *error))completionHandler {
    [[self listStackInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListStackInstancesOutput *> * _Nonnull task) {
        AWSCloudformationListStackInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListStackResourcesOutput *> *)listStackResources:(AWSCloudformationListStackResourcesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListStackResources"
                   outputClass:[AWSCloudformationListStackResourcesOutput class]];
}

- (void)listStackResources:(AWSCloudformationListStackResourcesInput *)request
     completionHandler:(void (^)(AWSCloudformationListStackResourcesOutput *response, NSError *error))completionHandler {
    [[self listStackResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListStackResourcesOutput *> * _Nonnull task) {
        AWSCloudformationListStackResourcesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListStackSetOperationResultsOutput *> *)listStackSetOperationResults:(AWSCloudformationListStackSetOperationResultsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListStackSetOperationResults"
                   outputClass:[AWSCloudformationListStackSetOperationResultsOutput class]];
}

- (void)listStackSetOperationResults:(AWSCloudformationListStackSetOperationResultsInput *)request
     completionHandler:(void (^)(AWSCloudformationListStackSetOperationResultsOutput *response, NSError *error))completionHandler {
    [[self listStackSetOperationResults:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListStackSetOperationResultsOutput *> * _Nonnull task) {
        AWSCloudformationListStackSetOperationResultsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListStackSetOperationsOutput *> *)listStackSetOperations:(AWSCloudformationListStackSetOperationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListStackSetOperations"
                   outputClass:[AWSCloudformationListStackSetOperationsOutput class]];
}

- (void)listStackSetOperations:(AWSCloudformationListStackSetOperationsInput *)request
     completionHandler:(void (^)(AWSCloudformationListStackSetOperationsOutput *response, NSError *error))completionHandler {
    [[self listStackSetOperations:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListStackSetOperationsOutput *> * _Nonnull task) {
        AWSCloudformationListStackSetOperationsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListStackSetsOutput *> *)listStackSets:(AWSCloudformationListStackSetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListStackSets"
                   outputClass:[AWSCloudformationListStackSetsOutput class]];
}

- (void)listStackSets:(AWSCloudformationListStackSetsInput *)request
     completionHandler:(void (^)(AWSCloudformationListStackSetsOutput *response, NSError *error))completionHandler {
    [[self listStackSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListStackSetsOutput *> * _Nonnull task) {
        AWSCloudformationListStackSetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListStacksOutput *> *)listStacks:(AWSCloudformationListStacksInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListStacks"
                   outputClass:[AWSCloudformationListStacksOutput class]];
}

- (void)listStacks:(AWSCloudformationListStacksInput *)request
     completionHandler:(void (^)(AWSCloudformationListStacksOutput *response, NSError *error))completionHandler {
    [[self listStacks:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListStacksOutput *> * _Nonnull task) {
        AWSCloudformationListStacksOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListTypeRegistrationsOutput *> *)listTypeRegistrations:(AWSCloudformationListTypeRegistrationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTypeRegistrations"
                   outputClass:[AWSCloudformationListTypeRegistrationsOutput class]];
}

- (void)listTypeRegistrations:(AWSCloudformationListTypeRegistrationsInput *)request
     completionHandler:(void (^)(AWSCloudformationListTypeRegistrationsOutput *response, NSError *error))completionHandler {
    [[self listTypeRegistrations:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListTypeRegistrationsOutput *> * _Nonnull task) {
        AWSCloudformationListTypeRegistrationsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListTypeVersionsOutput *> *)listTypeVersions:(AWSCloudformationListTypeVersionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTypeVersions"
                   outputClass:[AWSCloudformationListTypeVersionsOutput class]];
}

- (void)listTypeVersions:(AWSCloudformationListTypeVersionsInput *)request
     completionHandler:(void (^)(AWSCloudformationListTypeVersionsOutput *response, NSError *error))completionHandler {
    [[self listTypeVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListTypeVersionsOutput *> * _Nonnull task) {
        AWSCloudformationListTypeVersionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationListTypesOutput *> *)listTypes:(AWSCloudformationListTypesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTypes"
                   outputClass:[AWSCloudformationListTypesOutput class]];
}

- (void)listTypes:(AWSCloudformationListTypesInput *)request
     completionHandler:(void (^)(AWSCloudformationListTypesOutput *response, NSError *error))completionHandler {
    [[self listTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationListTypesOutput *> * _Nonnull task) {
        AWSCloudformationListTypesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationRecordHandlerProgressOutput *> *)recordHandlerProgress:(AWSCloudformationRecordHandlerProgressInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RecordHandlerProgress"
                   outputClass:[AWSCloudformationRecordHandlerProgressOutput class]];
}

- (void)recordHandlerProgress:(AWSCloudformationRecordHandlerProgressInput *)request
     completionHandler:(void (^)(AWSCloudformationRecordHandlerProgressOutput *response, NSError *error))completionHandler {
    [[self recordHandlerProgress:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationRecordHandlerProgressOutput *> * _Nonnull task) {
        AWSCloudformationRecordHandlerProgressOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationRegisterTypeOutput *> *)registerType:(AWSCloudformationRegisterTypeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterType"
                   outputClass:[AWSCloudformationRegisterTypeOutput class]];
}

- (void)registerType:(AWSCloudformationRegisterTypeInput *)request
     completionHandler:(void (^)(AWSCloudformationRegisterTypeOutput *response, NSError *error))completionHandler {
    [[self registerType:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationRegisterTypeOutput *> * _Nonnull task) {
        AWSCloudformationRegisterTypeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)setStackPolicy:(AWSCloudformationSetStackPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetStackPolicy"
                   outputClass:nil];
}

- (void)setStackPolicy:(AWSCloudformationSetStackPolicyInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setStackPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationSetTypeDefaultVersionOutput *> *)setTypeDefaultVersion:(AWSCloudformationSetTypeDefaultVersionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetTypeDefaultVersion"
                   outputClass:[AWSCloudformationSetTypeDefaultVersionOutput class]];
}

- (void)setTypeDefaultVersion:(AWSCloudformationSetTypeDefaultVersionInput *)request
     completionHandler:(void (^)(AWSCloudformationSetTypeDefaultVersionOutput *response, NSError *error))completionHandler {
    [[self setTypeDefaultVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationSetTypeDefaultVersionOutput *> * _Nonnull task) {
        AWSCloudformationSetTypeDefaultVersionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)signalResource:(AWSCloudformationSignalResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SignalResource"
                   outputClass:nil];
}

- (void)signalResource:(AWSCloudformationSignalResourceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self signalResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationStopStackSetOperationOutput *> *)stopStackSetOperation:(AWSCloudformationStopStackSetOperationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopStackSetOperation"
                   outputClass:[AWSCloudformationStopStackSetOperationOutput class]];
}

- (void)stopStackSetOperation:(AWSCloudformationStopStackSetOperationInput *)request
     completionHandler:(void (^)(AWSCloudformationStopStackSetOperationOutput *response, NSError *error))completionHandler {
    [[self stopStackSetOperation:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationStopStackSetOperationOutput *> * _Nonnull task) {
        AWSCloudformationStopStackSetOperationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationUpdateStackOutput *> *)updateStack:(AWSCloudformationUpdateStackInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateStack"
                   outputClass:[AWSCloudformationUpdateStackOutput class]];
}

- (void)updateStack:(AWSCloudformationUpdateStackInput *)request
     completionHandler:(void (^)(AWSCloudformationUpdateStackOutput *response, NSError *error))completionHandler {
    [[self updateStack:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationUpdateStackOutput *> * _Nonnull task) {
        AWSCloudformationUpdateStackOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationUpdateStackInstancesOutput *> *)updateStackInstances:(AWSCloudformationUpdateStackInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateStackInstances"
                   outputClass:[AWSCloudformationUpdateStackInstancesOutput class]];
}

- (void)updateStackInstances:(AWSCloudformationUpdateStackInstancesInput *)request
     completionHandler:(void (^)(AWSCloudformationUpdateStackInstancesOutput *response, NSError *error))completionHandler {
    [[self updateStackInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationUpdateStackInstancesOutput *> * _Nonnull task) {
        AWSCloudformationUpdateStackInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationUpdateStackSetOutput *> *)updateStackSet:(AWSCloudformationUpdateStackSetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateStackSet"
                   outputClass:[AWSCloudformationUpdateStackSetOutput class]];
}

- (void)updateStackSet:(AWSCloudformationUpdateStackSetInput *)request
     completionHandler:(void (^)(AWSCloudformationUpdateStackSetOutput *response, NSError *error))completionHandler {
    [[self updateStackSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationUpdateStackSetOutput *> * _Nonnull task) {
        AWSCloudformationUpdateStackSetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationUpdateTerminationProtectionOutput *> *)updateTerminationProtection:(AWSCloudformationUpdateTerminationProtectionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateTerminationProtection"
                   outputClass:[AWSCloudformationUpdateTerminationProtectionOutput class]];
}

- (void)updateTerminationProtection:(AWSCloudformationUpdateTerminationProtectionInput *)request
     completionHandler:(void (^)(AWSCloudformationUpdateTerminationProtectionOutput *response, NSError *error))completionHandler {
    [[self updateTerminationProtection:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationUpdateTerminationProtectionOutput *> * _Nonnull task) {
        AWSCloudformationUpdateTerminationProtectionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudformationValidateTemplateOutput *> *)validateTemplate:(AWSCloudformationValidateTemplateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ValidateTemplate"
                   outputClass:[AWSCloudformationValidateTemplateOutput class]];
}

- (void)validateTemplate:(AWSCloudformationValidateTemplateInput *)request
     completionHandler:(void (^)(AWSCloudformationValidateTemplateOutput *response, NSError *error))completionHandler {
    [[self validateTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudformationValidateTemplateOutput *> * _Nonnull task) {
        AWSCloudformationValidateTemplateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
