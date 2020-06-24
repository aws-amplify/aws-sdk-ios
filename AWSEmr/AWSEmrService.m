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

#import "AWSEmrService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSEmrResources.h"

static NSString *const AWSInfoEmr = @"Emr";
NSString *const AWSEmrSDKVersion = @"2.13.5";


@interface AWSEmrResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSEmrResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalServerError" : @(AWSEmrErrorInternalServer),
                            @"InvalidRequestException" : @(AWSEmrErrorInvalidRequest),
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
	                *error = [NSError errorWithDomain:AWSEmrErrorDomain
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
        *error = [NSError errorWithDomain:AWSEmrErrorDomain
                                     code:AWSEmrErrorUnknown
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

@interface AWSEmrRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSEmrRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSEmr()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSEmr

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSEmrSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSEmr versions need to match. Check your SDK installation. AWSCore: %@ AWSEmr: %@", AWSiOSSDKVersion, AWSEmrSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultEmr {
    static AWSEmr *_defaultEmr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoEmr];
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
        _defaultEmr = [[AWSEmr alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultEmr;
}

+ (void)registerEmrWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSEmr alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)EmrForKey:(NSString *)key {
    @synchronized(self) {
        AWSEmr *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoEmr
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSEmr registerEmrWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeEmrForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultEmr` or `+ EmrForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceEmr
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceEmr];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSEmrRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSEmrResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSEmrResponseSerializer alloc] initWithJSONDefinition:[[AWSEmrResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSEmrAddInstanceFleetOutput *> *)addInstanceFleet:(AWSEmrAddInstanceFleetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"AddInstanceFleet"
                   outputClass:[AWSEmrAddInstanceFleetOutput class]];
}

- (void)addInstanceFleet:(AWSEmrAddInstanceFleetInput *)request
     completionHandler:(void (^)(AWSEmrAddInstanceFleetOutput *response, NSError *error))completionHandler {
    [[self addInstanceFleet:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrAddInstanceFleetOutput *> * _Nonnull task) {
        AWSEmrAddInstanceFleetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrAddInstanceGroupsOutput *> *)addInstanceGroups:(AWSEmrAddInstanceGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"AddInstanceGroups"
                   outputClass:[AWSEmrAddInstanceGroupsOutput class]];
}

- (void)addInstanceGroups:(AWSEmrAddInstanceGroupsInput *)request
     completionHandler:(void (^)(AWSEmrAddInstanceGroupsOutput *response, NSError *error))completionHandler {
    [[self addInstanceGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrAddInstanceGroupsOutput *> * _Nonnull task) {
        AWSEmrAddInstanceGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrAddJobFlowStepsOutput *> *)addJobFlowSteps:(AWSEmrAddJobFlowStepsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"AddJobFlowSteps"
                   outputClass:[AWSEmrAddJobFlowStepsOutput class]];
}

- (void)addJobFlowSteps:(AWSEmrAddJobFlowStepsInput *)request
     completionHandler:(void (^)(AWSEmrAddJobFlowStepsOutput *response, NSError *error))completionHandler {
    [[self addJobFlowSteps:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrAddJobFlowStepsOutput *> * _Nonnull task) {
        AWSEmrAddJobFlowStepsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrAddTagsOutput *> *)addTags:(AWSEmrAddTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"AddTags"
                   outputClass:[AWSEmrAddTagsOutput class]];
}

- (void)addTags:(AWSEmrAddTagsInput *)request
     completionHandler:(void (^)(AWSEmrAddTagsOutput *response, NSError *error))completionHandler {
    [[self addTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrAddTagsOutput *> * _Nonnull task) {
        AWSEmrAddTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrCancelStepsOutput *> *)cancelSteps:(AWSEmrCancelStepsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"CancelSteps"
                   outputClass:[AWSEmrCancelStepsOutput class]];
}

- (void)cancelSteps:(AWSEmrCancelStepsInput *)request
     completionHandler:(void (^)(AWSEmrCancelStepsOutput *response, NSError *error))completionHandler {
    [[self cancelSteps:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrCancelStepsOutput *> * _Nonnull task) {
        AWSEmrCancelStepsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrCreateSecurityConfigurationOutput *> *)createSecurityConfiguration:(AWSEmrCreateSecurityConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"CreateSecurityConfiguration"
                   outputClass:[AWSEmrCreateSecurityConfigurationOutput class]];
}

- (void)createSecurityConfiguration:(AWSEmrCreateSecurityConfigurationInput *)request
     completionHandler:(void (^)(AWSEmrCreateSecurityConfigurationOutput *response, NSError *error))completionHandler {
    [[self createSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrCreateSecurityConfigurationOutput *> * _Nonnull task) {
        AWSEmrCreateSecurityConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrDeleteSecurityConfigurationOutput *> *)deleteSecurityConfiguration:(AWSEmrDeleteSecurityConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DeleteSecurityConfiguration"
                   outputClass:[AWSEmrDeleteSecurityConfigurationOutput class]];
}

- (void)deleteSecurityConfiguration:(AWSEmrDeleteSecurityConfigurationInput *)request
     completionHandler:(void (^)(AWSEmrDeleteSecurityConfigurationOutput *response, NSError *error))completionHandler {
    [[self deleteSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrDeleteSecurityConfigurationOutput *> * _Nonnull task) {
        AWSEmrDeleteSecurityConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrDescribeClusterOutput *> *)describeCluster:(AWSEmrDescribeClusterInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DescribeCluster"
                   outputClass:[AWSEmrDescribeClusterOutput class]];
}

- (void)describeCluster:(AWSEmrDescribeClusterInput *)request
     completionHandler:(void (^)(AWSEmrDescribeClusterOutput *response, NSError *error))completionHandler {
    [[self describeCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrDescribeClusterOutput *> * _Nonnull task) {
        AWSEmrDescribeClusterOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrDescribeJobFlowsOutput *> *)describeJobFlows:(AWSEmrDescribeJobFlowsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DescribeJobFlows"
                   outputClass:[AWSEmrDescribeJobFlowsOutput class]];
}

- (void)describeJobFlows:(AWSEmrDescribeJobFlowsInput *)request
     completionHandler:(void (^)(AWSEmrDescribeJobFlowsOutput *response, NSError *error))completionHandler {
    [[self describeJobFlows:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrDescribeJobFlowsOutput *> * _Nonnull task) {
        AWSEmrDescribeJobFlowsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrDescribeSecurityConfigurationOutput *> *)describeSecurityConfiguration:(AWSEmrDescribeSecurityConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DescribeSecurityConfiguration"
                   outputClass:[AWSEmrDescribeSecurityConfigurationOutput class]];
}

- (void)describeSecurityConfiguration:(AWSEmrDescribeSecurityConfigurationInput *)request
     completionHandler:(void (^)(AWSEmrDescribeSecurityConfigurationOutput *response, NSError *error))completionHandler {
    [[self describeSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrDescribeSecurityConfigurationOutput *> * _Nonnull task) {
        AWSEmrDescribeSecurityConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrDescribeStepOutput *> *)describeStep:(AWSEmrDescribeStepInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DescribeStep"
                   outputClass:[AWSEmrDescribeStepOutput class]];
}

- (void)describeStep:(AWSEmrDescribeStepInput *)request
     completionHandler:(void (^)(AWSEmrDescribeStepOutput *response, NSError *error))completionHandler {
    [[self describeStep:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrDescribeStepOutput *> * _Nonnull task) {
        AWSEmrDescribeStepOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrGetBlockPublicAccessConfigurationOutput *> *)getBlockPublicAccessConfiguration:(AWSEmrGetBlockPublicAccessConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"GetBlockPublicAccessConfiguration"
                   outputClass:[AWSEmrGetBlockPublicAccessConfigurationOutput class]];
}

- (void)getBlockPublicAccessConfiguration:(AWSEmrGetBlockPublicAccessConfigurationInput *)request
     completionHandler:(void (^)(AWSEmrGetBlockPublicAccessConfigurationOutput *response, NSError *error))completionHandler {
    [[self getBlockPublicAccessConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrGetBlockPublicAccessConfigurationOutput *> * _Nonnull task) {
        AWSEmrGetBlockPublicAccessConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrGetManagedScalingPolicyOutput *> *)getManagedScalingPolicy:(AWSEmrGetManagedScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"GetManagedScalingPolicy"
                   outputClass:[AWSEmrGetManagedScalingPolicyOutput class]];
}

- (void)getManagedScalingPolicy:(AWSEmrGetManagedScalingPolicyInput *)request
     completionHandler:(void (^)(AWSEmrGetManagedScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self getManagedScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrGetManagedScalingPolicyOutput *> * _Nonnull task) {
        AWSEmrGetManagedScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrListBootstrapActionsOutput *> *)listBootstrapActions:(AWSEmrListBootstrapActionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListBootstrapActions"
                   outputClass:[AWSEmrListBootstrapActionsOutput class]];
}

- (void)listBootstrapActions:(AWSEmrListBootstrapActionsInput *)request
     completionHandler:(void (^)(AWSEmrListBootstrapActionsOutput *response, NSError *error))completionHandler {
    [[self listBootstrapActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrListBootstrapActionsOutput *> * _Nonnull task) {
        AWSEmrListBootstrapActionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrListClustersOutput *> *)listClusters:(AWSEmrListClustersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListClusters"
                   outputClass:[AWSEmrListClustersOutput class]];
}

- (void)listClusters:(AWSEmrListClustersInput *)request
     completionHandler:(void (^)(AWSEmrListClustersOutput *response, NSError *error))completionHandler {
    [[self listClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrListClustersOutput *> * _Nonnull task) {
        AWSEmrListClustersOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrListInstanceFleetsOutput *> *)listInstanceFleets:(AWSEmrListInstanceFleetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListInstanceFleets"
                   outputClass:[AWSEmrListInstanceFleetsOutput class]];
}

- (void)listInstanceFleets:(AWSEmrListInstanceFleetsInput *)request
     completionHandler:(void (^)(AWSEmrListInstanceFleetsOutput *response, NSError *error))completionHandler {
    [[self listInstanceFleets:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrListInstanceFleetsOutput *> * _Nonnull task) {
        AWSEmrListInstanceFleetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrListInstanceGroupsOutput *> *)listInstanceGroups:(AWSEmrListInstanceGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListInstanceGroups"
                   outputClass:[AWSEmrListInstanceGroupsOutput class]];
}

- (void)listInstanceGroups:(AWSEmrListInstanceGroupsInput *)request
     completionHandler:(void (^)(AWSEmrListInstanceGroupsOutput *response, NSError *error))completionHandler {
    [[self listInstanceGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrListInstanceGroupsOutput *> * _Nonnull task) {
        AWSEmrListInstanceGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrListInstancesOutput *> *)listInstances:(AWSEmrListInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListInstances"
                   outputClass:[AWSEmrListInstancesOutput class]];
}

- (void)listInstances:(AWSEmrListInstancesInput *)request
     completionHandler:(void (^)(AWSEmrListInstancesOutput *response, NSError *error))completionHandler {
    [[self listInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrListInstancesOutput *> * _Nonnull task) {
        AWSEmrListInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrListSecurityConfigurationsOutput *> *)listSecurityConfigurations:(AWSEmrListSecurityConfigurationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListSecurityConfigurations"
                   outputClass:[AWSEmrListSecurityConfigurationsOutput class]];
}

- (void)listSecurityConfigurations:(AWSEmrListSecurityConfigurationsInput *)request
     completionHandler:(void (^)(AWSEmrListSecurityConfigurationsOutput *response, NSError *error))completionHandler {
    [[self listSecurityConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrListSecurityConfigurationsOutput *> * _Nonnull task) {
        AWSEmrListSecurityConfigurationsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrListStepsOutput *> *)listSteps:(AWSEmrListStepsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListSteps"
                   outputClass:[AWSEmrListStepsOutput class]];
}

- (void)listSteps:(AWSEmrListStepsInput *)request
     completionHandler:(void (^)(AWSEmrListStepsOutput *response, NSError *error))completionHandler {
    [[self listSteps:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrListStepsOutput *> * _Nonnull task) {
        AWSEmrListStepsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrModifyClusterOutput *> *)modifyCluster:(AWSEmrModifyClusterInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ModifyCluster"
                   outputClass:[AWSEmrModifyClusterOutput class]];
}

- (void)modifyCluster:(AWSEmrModifyClusterInput *)request
     completionHandler:(void (^)(AWSEmrModifyClusterOutput *response, NSError *error))completionHandler {
    [[self modifyCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrModifyClusterOutput *> * _Nonnull task) {
        AWSEmrModifyClusterOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyInstanceFleet:(AWSEmrModifyInstanceFleetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ModifyInstanceFleet"
                   outputClass:nil];
}

- (void)modifyInstanceFleet:(AWSEmrModifyInstanceFleetInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyInstanceFleet:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyInstanceGroups:(AWSEmrModifyInstanceGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ModifyInstanceGroups"
                   outputClass:nil];
}

- (void)modifyInstanceGroups:(AWSEmrModifyInstanceGroupsInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyInstanceGroups:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrPutAutoScalingPolicyOutput *> *)putAutoScalingPolicy:(AWSEmrPutAutoScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"PutAutoScalingPolicy"
                   outputClass:[AWSEmrPutAutoScalingPolicyOutput class]];
}

- (void)putAutoScalingPolicy:(AWSEmrPutAutoScalingPolicyInput *)request
     completionHandler:(void (^)(AWSEmrPutAutoScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self putAutoScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrPutAutoScalingPolicyOutput *> * _Nonnull task) {
        AWSEmrPutAutoScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrPutBlockPublicAccessConfigurationOutput *> *)putBlockPublicAccessConfiguration:(AWSEmrPutBlockPublicAccessConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"PutBlockPublicAccessConfiguration"
                   outputClass:[AWSEmrPutBlockPublicAccessConfigurationOutput class]];
}

- (void)putBlockPublicAccessConfiguration:(AWSEmrPutBlockPublicAccessConfigurationInput *)request
     completionHandler:(void (^)(AWSEmrPutBlockPublicAccessConfigurationOutput *response, NSError *error))completionHandler {
    [[self putBlockPublicAccessConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrPutBlockPublicAccessConfigurationOutput *> * _Nonnull task) {
        AWSEmrPutBlockPublicAccessConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrPutManagedScalingPolicyOutput *> *)putManagedScalingPolicy:(AWSEmrPutManagedScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"PutManagedScalingPolicy"
                   outputClass:[AWSEmrPutManagedScalingPolicyOutput class]];
}

- (void)putManagedScalingPolicy:(AWSEmrPutManagedScalingPolicyInput *)request
     completionHandler:(void (^)(AWSEmrPutManagedScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self putManagedScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrPutManagedScalingPolicyOutput *> * _Nonnull task) {
        AWSEmrPutManagedScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrRemoveAutoScalingPolicyOutput *> *)removeAutoScalingPolicy:(AWSEmrRemoveAutoScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"RemoveAutoScalingPolicy"
                   outputClass:[AWSEmrRemoveAutoScalingPolicyOutput class]];
}

- (void)removeAutoScalingPolicy:(AWSEmrRemoveAutoScalingPolicyInput *)request
     completionHandler:(void (^)(AWSEmrRemoveAutoScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self removeAutoScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrRemoveAutoScalingPolicyOutput *> * _Nonnull task) {
        AWSEmrRemoveAutoScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrRemoveManagedScalingPolicyOutput *> *)removeManagedScalingPolicy:(AWSEmrRemoveManagedScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"RemoveManagedScalingPolicy"
                   outputClass:[AWSEmrRemoveManagedScalingPolicyOutput class]];
}

- (void)removeManagedScalingPolicy:(AWSEmrRemoveManagedScalingPolicyInput *)request
     completionHandler:(void (^)(AWSEmrRemoveManagedScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self removeManagedScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrRemoveManagedScalingPolicyOutput *> * _Nonnull task) {
        AWSEmrRemoveManagedScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrRemoveTagsOutput *> *)removeTags:(AWSEmrRemoveTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"RemoveTags"
                   outputClass:[AWSEmrRemoveTagsOutput class]];
}

- (void)removeTags:(AWSEmrRemoveTagsInput *)request
     completionHandler:(void (^)(AWSEmrRemoveTagsOutput *response, NSError *error))completionHandler {
    [[self removeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrRemoveTagsOutput *> * _Nonnull task) {
        AWSEmrRemoveTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEmrRunJobFlowOutput *> *)runJobFlow:(AWSEmrRunJobFlowInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"RunJobFlow"
                   outputClass:[AWSEmrRunJobFlowOutput class]];
}

- (void)runJobFlow:(AWSEmrRunJobFlowInput *)request
     completionHandler:(void (^)(AWSEmrRunJobFlowOutput *response, NSError *error))completionHandler {
    [[self runJobFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSEmrRunJobFlowOutput *> * _Nonnull task) {
        AWSEmrRunJobFlowOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)setTerminationProtection:(AWSEmrSetTerminationProtectionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"SetTerminationProtection"
                   outputClass:nil];
}

- (void)setTerminationProtection:(AWSEmrSetTerminationProtectionInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setTerminationProtection:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)setVisibleToAllUsers:(AWSEmrSetVisibleToAllUsersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"SetVisibleToAllUsers"
                   outputClass:nil];
}

- (void)setVisibleToAllUsers:(AWSEmrSetVisibleToAllUsersInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setVisibleToAllUsers:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)terminateJobFlows:(AWSEmrTerminateJobFlowsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"TerminateJobFlows"
                   outputClass:nil];
}

- (void)terminateJobFlows:(AWSEmrTerminateJobFlowsInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self terminateJobFlows:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
