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

#import "AWSelasticmapreduceService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSelasticmapreduceResources.h"

static NSString *const AWSInfoelasticmapreduce = @"elasticmapreduce";
NSString *const AWSelasticmapreduceSDKVersion = @"2.13.2";


@interface AWSelasticmapreduceResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSelasticmapreduceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalServerError" : @(AWSelasticmapreduceErrorInternalServer),
                            @"InvalidRequestException" : @(AWSelasticmapreduceErrorInvalidRequest),
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
	                *error = [NSError errorWithDomain:AWSelasticmapreduceErrorDomain
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
        *error = [NSError errorWithDomain:AWSelasticmapreduceErrorDomain
                                     code:AWSelasticmapreduceErrorUnknown
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

@interface AWSelasticmapreduceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSelasticmapreduceRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSelasticmapreduce()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSelasticmapreduce

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSelasticmapreduceSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSelasticmapreduce versions need to match. Check your SDK installation. AWSCore: %@ AWSelasticmapreduce: %@", AWSiOSSDKVersion, AWSelasticmapreduceSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultelasticmapreduce {
    static AWSelasticmapreduce *_defaultelasticmapreduce = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoelasticmapreduce];
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
        _defaultelasticmapreduce = [[AWSelasticmapreduce alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultelasticmapreduce;
}

+ (void)registerelasticmapreduceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSelasticmapreduce alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)elasticmapreduceForKey:(NSString *)key {
    @synchronized(self) {
        AWSelasticmapreduce *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoelasticmapreduce
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeelasticmapreduceForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultelasticmapreduce` or `+ elasticmapreduceForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceelasticmapreduce
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceelasticmapreduce];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSelasticmapreduceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSelasticmapreduceResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSelasticmapreduceResponseSerializer alloc] initWithJSONDefinition:[[AWSelasticmapreduceResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSelasticmapreduceAddInstanceFleetOutput *> *)addInstanceFleet:(AWSelasticmapreduceAddInstanceFleetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"AddInstanceFleet"
                   outputClass:[AWSelasticmapreduceAddInstanceFleetOutput class]];
}

- (void)addInstanceFleet:(AWSelasticmapreduceAddInstanceFleetInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceAddInstanceFleetOutput *response, NSError *error))completionHandler {
    [[self addInstanceFleet:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceAddInstanceFleetOutput *> * _Nonnull task) {
        AWSelasticmapreduceAddInstanceFleetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceAddInstanceGroupsOutput *> *)addInstanceGroups:(AWSelasticmapreduceAddInstanceGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"AddInstanceGroups"
                   outputClass:[AWSelasticmapreduceAddInstanceGroupsOutput class]];
}

- (void)addInstanceGroups:(AWSelasticmapreduceAddInstanceGroupsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceAddInstanceGroupsOutput *response, NSError *error))completionHandler {
    [[self addInstanceGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceAddInstanceGroupsOutput *> * _Nonnull task) {
        AWSelasticmapreduceAddInstanceGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceAddJobFlowStepsOutput *> *)addJobFlowSteps:(AWSelasticmapreduceAddJobFlowStepsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"AddJobFlowSteps"
                   outputClass:[AWSelasticmapreduceAddJobFlowStepsOutput class]];
}

- (void)addJobFlowSteps:(AWSelasticmapreduceAddJobFlowStepsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceAddJobFlowStepsOutput *response, NSError *error))completionHandler {
    [[self addJobFlowSteps:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceAddJobFlowStepsOutput *> * _Nonnull task) {
        AWSelasticmapreduceAddJobFlowStepsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceAddTagsOutput *> *)addTags:(AWSelasticmapreduceAddTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"AddTags"
                   outputClass:[AWSelasticmapreduceAddTagsOutput class]];
}

- (void)addTags:(AWSelasticmapreduceAddTagsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceAddTagsOutput *response, NSError *error))completionHandler {
    [[self addTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceAddTagsOutput *> * _Nonnull task) {
        AWSelasticmapreduceAddTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceCancelStepsOutput *> *)cancelSteps:(AWSelasticmapreduceCancelStepsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"CancelSteps"
                   outputClass:[AWSelasticmapreduceCancelStepsOutput class]];
}

- (void)cancelSteps:(AWSelasticmapreduceCancelStepsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceCancelStepsOutput *response, NSError *error))completionHandler {
    [[self cancelSteps:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceCancelStepsOutput *> * _Nonnull task) {
        AWSelasticmapreduceCancelStepsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceCreateSecurityConfigurationOutput *> *)createSecurityConfiguration:(AWSelasticmapreduceCreateSecurityConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"CreateSecurityConfiguration"
                   outputClass:[AWSelasticmapreduceCreateSecurityConfigurationOutput class]];
}

- (void)createSecurityConfiguration:(AWSelasticmapreduceCreateSecurityConfigurationInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceCreateSecurityConfigurationOutput *response, NSError *error))completionHandler {
    [[self createSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceCreateSecurityConfigurationOutput *> * _Nonnull task) {
        AWSelasticmapreduceCreateSecurityConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceDeleteSecurityConfigurationOutput *> *)deleteSecurityConfiguration:(AWSelasticmapreduceDeleteSecurityConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DeleteSecurityConfiguration"
                   outputClass:[AWSelasticmapreduceDeleteSecurityConfigurationOutput class]];
}

- (void)deleteSecurityConfiguration:(AWSelasticmapreduceDeleteSecurityConfigurationInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceDeleteSecurityConfigurationOutput *response, NSError *error))completionHandler {
    [[self deleteSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceDeleteSecurityConfigurationOutput *> * _Nonnull task) {
        AWSelasticmapreduceDeleteSecurityConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceDescribeClusterOutput *> *)describeCluster:(AWSelasticmapreduceDescribeClusterInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DescribeCluster"
                   outputClass:[AWSelasticmapreduceDescribeClusterOutput class]];
}

- (void)describeCluster:(AWSelasticmapreduceDescribeClusterInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceDescribeClusterOutput *response, NSError *error))completionHandler {
    [[self describeCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceDescribeClusterOutput *> * _Nonnull task) {
        AWSelasticmapreduceDescribeClusterOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceDescribeJobFlowsOutput *> *)describeJobFlows:(AWSelasticmapreduceDescribeJobFlowsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DescribeJobFlows"
                   outputClass:[AWSelasticmapreduceDescribeJobFlowsOutput class]];
}

- (void)describeJobFlows:(AWSelasticmapreduceDescribeJobFlowsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceDescribeJobFlowsOutput *response, NSError *error))completionHandler {
    [[self describeJobFlows:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceDescribeJobFlowsOutput *> * _Nonnull task) {
        AWSelasticmapreduceDescribeJobFlowsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceDescribeSecurityConfigurationOutput *> *)describeSecurityConfiguration:(AWSelasticmapreduceDescribeSecurityConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DescribeSecurityConfiguration"
                   outputClass:[AWSelasticmapreduceDescribeSecurityConfigurationOutput class]];
}

- (void)describeSecurityConfiguration:(AWSelasticmapreduceDescribeSecurityConfigurationInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceDescribeSecurityConfigurationOutput *response, NSError *error))completionHandler {
    [[self describeSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceDescribeSecurityConfigurationOutput *> * _Nonnull task) {
        AWSelasticmapreduceDescribeSecurityConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceDescribeStepOutput *> *)describeStep:(AWSelasticmapreduceDescribeStepInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"DescribeStep"
                   outputClass:[AWSelasticmapreduceDescribeStepOutput class]];
}

- (void)describeStep:(AWSelasticmapreduceDescribeStepInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceDescribeStepOutput *response, NSError *error))completionHandler {
    [[self describeStep:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceDescribeStepOutput *> * _Nonnull task) {
        AWSelasticmapreduceDescribeStepOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput *> *)getBlockPublicAccessConfiguration:(AWSelasticmapreduceGetBlockPublicAccessConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"GetBlockPublicAccessConfiguration"
                   outputClass:[AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput class]];
}

- (void)getBlockPublicAccessConfiguration:(AWSelasticmapreduceGetBlockPublicAccessConfigurationInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput *response, NSError *error))completionHandler {
    [[self getBlockPublicAccessConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput *> * _Nonnull task) {
        AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceGetManagedScalingPolicyOutput *> *)getManagedScalingPolicy:(AWSelasticmapreduceGetManagedScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"GetManagedScalingPolicy"
                   outputClass:[AWSelasticmapreduceGetManagedScalingPolicyOutput class]];
}

- (void)getManagedScalingPolicy:(AWSelasticmapreduceGetManagedScalingPolicyInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceGetManagedScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self getManagedScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceGetManagedScalingPolicyOutput *> * _Nonnull task) {
        AWSelasticmapreduceGetManagedScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceListBootstrapActionsOutput *> *)listBootstrapActions:(AWSelasticmapreduceListBootstrapActionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListBootstrapActions"
                   outputClass:[AWSelasticmapreduceListBootstrapActionsOutput class]];
}

- (void)listBootstrapActions:(AWSelasticmapreduceListBootstrapActionsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceListBootstrapActionsOutput *response, NSError *error))completionHandler {
    [[self listBootstrapActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceListBootstrapActionsOutput *> * _Nonnull task) {
        AWSelasticmapreduceListBootstrapActionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceListClustersOutput *> *)listClusters:(AWSelasticmapreduceListClustersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListClusters"
                   outputClass:[AWSelasticmapreduceListClustersOutput class]];
}

- (void)listClusters:(AWSelasticmapreduceListClustersInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceListClustersOutput *response, NSError *error))completionHandler {
    [[self listClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceListClustersOutput *> * _Nonnull task) {
        AWSelasticmapreduceListClustersOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceListInstanceFleetsOutput *> *)listInstanceFleets:(AWSelasticmapreduceListInstanceFleetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListInstanceFleets"
                   outputClass:[AWSelasticmapreduceListInstanceFleetsOutput class]];
}

- (void)listInstanceFleets:(AWSelasticmapreduceListInstanceFleetsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceListInstanceFleetsOutput *response, NSError *error))completionHandler {
    [[self listInstanceFleets:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceListInstanceFleetsOutput *> * _Nonnull task) {
        AWSelasticmapreduceListInstanceFleetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceListInstanceGroupsOutput *> *)listInstanceGroups:(AWSelasticmapreduceListInstanceGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListInstanceGroups"
                   outputClass:[AWSelasticmapreduceListInstanceGroupsOutput class]];
}

- (void)listInstanceGroups:(AWSelasticmapreduceListInstanceGroupsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceListInstanceGroupsOutput *response, NSError *error))completionHandler {
    [[self listInstanceGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceListInstanceGroupsOutput *> * _Nonnull task) {
        AWSelasticmapreduceListInstanceGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceListInstancesOutput *> *)listInstances:(AWSelasticmapreduceListInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListInstances"
                   outputClass:[AWSelasticmapreduceListInstancesOutput class]];
}

- (void)listInstances:(AWSelasticmapreduceListInstancesInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceListInstancesOutput *response, NSError *error))completionHandler {
    [[self listInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceListInstancesOutput *> * _Nonnull task) {
        AWSelasticmapreduceListInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceListSecurityConfigurationsOutput *> *)listSecurityConfigurations:(AWSelasticmapreduceListSecurityConfigurationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListSecurityConfigurations"
                   outputClass:[AWSelasticmapreduceListSecurityConfigurationsOutput class]];
}

- (void)listSecurityConfigurations:(AWSelasticmapreduceListSecurityConfigurationsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceListSecurityConfigurationsOutput *response, NSError *error))completionHandler {
    [[self listSecurityConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceListSecurityConfigurationsOutput *> * _Nonnull task) {
        AWSelasticmapreduceListSecurityConfigurationsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceListStepsOutput *> *)listSteps:(AWSelasticmapreduceListStepsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ListSteps"
                   outputClass:[AWSelasticmapreduceListStepsOutput class]];
}

- (void)listSteps:(AWSelasticmapreduceListStepsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceListStepsOutput *response, NSError *error))completionHandler {
    [[self listSteps:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceListStepsOutput *> * _Nonnull task) {
        AWSelasticmapreduceListStepsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceModifyClusterOutput *> *)modifyCluster:(AWSelasticmapreduceModifyClusterInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ModifyCluster"
                   outputClass:[AWSelasticmapreduceModifyClusterOutput class]];
}

- (void)modifyCluster:(AWSelasticmapreduceModifyClusterInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceModifyClusterOutput *response, NSError *error))completionHandler {
    [[self modifyCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceModifyClusterOutput *> * _Nonnull task) {
        AWSelasticmapreduceModifyClusterOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyInstanceFleet:(AWSelasticmapreduceModifyInstanceFleetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ModifyInstanceFleet"
                   outputClass:nil];
}

- (void)modifyInstanceFleet:(AWSelasticmapreduceModifyInstanceFleetInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyInstanceFleet:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyInstanceGroups:(AWSelasticmapreduceModifyInstanceGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"ModifyInstanceGroups"
                   outputClass:nil];
}

- (void)modifyInstanceGroups:(AWSelasticmapreduceModifyInstanceGroupsInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyInstanceGroups:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreducePutAutoScalingPolicyOutput *> *)putAutoScalingPolicy:(AWSelasticmapreducePutAutoScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"PutAutoScalingPolicy"
                   outputClass:[AWSelasticmapreducePutAutoScalingPolicyOutput class]];
}

- (void)putAutoScalingPolicy:(AWSelasticmapreducePutAutoScalingPolicyInput *)request
     completionHandler:(void (^)(AWSelasticmapreducePutAutoScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self putAutoScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreducePutAutoScalingPolicyOutput *> * _Nonnull task) {
        AWSelasticmapreducePutAutoScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreducePutBlockPublicAccessConfigurationOutput *> *)putBlockPublicAccessConfiguration:(AWSelasticmapreducePutBlockPublicAccessConfigurationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"PutBlockPublicAccessConfiguration"
                   outputClass:[AWSelasticmapreducePutBlockPublicAccessConfigurationOutput class]];
}

- (void)putBlockPublicAccessConfiguration:(AWSelasticmapreducePutBlockPublicAccessConfigurationInput *)request
     completionHandler:(void (^)(AWSelasticmapreducePutBlockPublicAccessConfigurationOutput *response, NSError *error))completionHandler {
    [[self putBlockPublicAccessConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreducePutBlockPublicAccessConfigurationOutput *> * _Nonnull task) {
        AWSelasticmapreducePutBlockPublicAccessConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreducePutManagedScalingPolicyOutput *> *)putManagedScalingPolicy:(AWSelasticmapreducePutManagedScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"PutManagedScalingPolicy"
                   outputClass:[AWSelasticmapreducePutManagedScalingPolicyOutput class]];
}

- (void)putManagedScalingPolicy:(AWSelasticmapreducePutManagedScalingPolicyInput *)request
     completionHandler:(void (^)(AWSelasticmapreducePutManagedScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self putManagedScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreducePutManagedScalingPolicyOutput *> * _Nonnull task) {
        AWSelasticmapreducePutManagedScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceRemoveAutoScalingPolicyOutput *> *)removeAutoScalingPolicy:(AWSelasticmapreduceRemoveAutoScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"RemoveAutoScalingPolicy"
                   outputClass:[AWSelasticmapreduceRemoveAutoScalingPolicyOutput class]];
}

- (void)removeAutoScalingPolicy:(AWSelasticmapreduceRemoveAutoScalingPolicyInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceRemoveAutoScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self removeAutoScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceRemoveAutoScalingPolicyOutput *> * _Nonnull task) {
        AWSelasticmapreduceRemoveAutoScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceRemoveManagedScalingPolicyOutput *> *)removeManagedScalingPolicy:(AWSelasticmapreduceRemoveManagedScalingPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"RemoveManagedScalingPolicy"
                   outputClass:[AWSelasticmapreduceRemoveManagedScalingPolicyOutput class]];
}

- (void)removeManagedScalingPolicy:(AWSelasticmapreduceRemoveManagedScalingPolicyInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceRemoveManagedScalingPolicyOutput *response, NSError *error))completionHandler {
    [[self removeManagedScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceRemoveManagedScalingPolicyOutput *> * _Nonnull task) {
        AWSelasticmapreduceRemoveManagedScalingPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceRemoveTagsOutput *> *)removeTags:(AWSelasticmapreduceRemoveTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"RemoveTags"
                   outputClass:[AWSelasticmapreduceRemoveTagsOutput class]];
}

- (void)removeTags:(AWSelasticmapreduceRemoveTagsInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceRemoveTagsOutput *response, NSError *error))completionHandler {
    [[self removeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceRemoveTagsOutput *> * _Nonnull task) {
        AWSelasticmapreduceRemoveTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticmapreduceRunJobFlowOutput *> *)runJobFlow:(AWSelasticmapreduceRunJobFlowInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"RunJobFlow"
                   outputClass:[AWSelasticmapreduceRunJobFlowOutput class]];
}

- (void)runJobFlow:(AWSelasticmapreduceRunJobFlowInput *)request
     completionHandler:(void (^)(AWSelasticmapreduceRunJobFlowOutput *response, NSError *error))completionHandler {
    [[self runJobFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticmapreduceRunJobFlowOutput *> * _Nonnull task) {
        AWSelasticmapreduceRunJobFlowOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)setTerminationProtection:(AWSelasticmapreduceSetTerminationProtectionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"SetTerminationProtection"
                   outputClass:nil];
}

- (void)setTerminationProtection:(AWSelasticmapreduceSetTerminationProtectionInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setTerminationProtection:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)setVisibleToAllUsers:(AWSelasticmapreduceSetVisibleToAllUsersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"SetVisibleToAllUsers"
                   outputClass:nil];
}

- (void)setVisibleToAllUsers:(AWSelasticmapreduceSetVisibleToAllUsersInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setVisibleToAllUsers:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)terminateJobFlows:(AWSelasticmapreduceTerminateJobFlowsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ElasticMapReduce"
                 operationName:@"TerminateJobFlows"
                   outputClass:nil];
}

- (void)terminateJobFlows:(AWSelasticmapreduceTerminateJobFlowsInput *)request
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
