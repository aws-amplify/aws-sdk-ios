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

#import "AWSCodedeployService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSCodedeployResources.h"

static NSString *const AWSInfoCodedeploy = @"Codedeploy";
NSString *const AWSCodedeploySDKVersion = @"2.13.3";


@interface AWSCodedeployResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSCodedeployResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlarmsLimitExceededException" : @(AWSCodedeployErrorAlarmsLimitExceeded),
                            @"ApplicationAlreadyExistsException" : @(AWSCodedeployErrorApplicationAlreadyExists),
                            @"ApplicationDoesNotExistException" : @(AWSCodedeployErrorApplicationDoesNotExist),
                            @"ApplicationLimitExceededException" : @(AWSCodedeployErrorApplicationLimitExceeded),
                            @"ApplicationNameRequiredException" : @(AWSCodedeployErrorApplicationNameRequired),
                            @"ArnNotSupportedException" : @(AWSCodedeployErrorArnNotSupported),
                            @"BatchLimitExceededException" : @(AWSCodedeployErrorBatchLimitExceeded),
                            @"BucketNameFilterRequiredException" : @(AWSCodedeployErrorBucketNameFilterRequired),
                            @"DeploymentAlreadyCompletedException" : @(AWSCodedeployErrorDeploymentAlreadyCompleted),
                            @"DeploymentConfigAlreadyExistsException" : @(AWSCodedeployErrorDeploymentConfigAlreadyExists),
                            @"DeploymentConfigDoesNotExistException" : @(AWSCodedeployErrorDeploymentConfigDoesNotExist),
                            @"DeploymentConfigInUseException" : @(AWSCodedeployErrorDeploymentConfigInUse),
                            @"DeploymentConfigLimitExceededException" : @(AWSCodedeployErrorDeploymentConfigLimitExceeded),
                            @"DeploymentConfigNameRequiredException" : @(AWSCodedeployErrorDeploymentConfigNameRequired),
                            @"DeploymentDoesNotExistException" : @(AWSCodedeployErrorDeploymentDoesNotExist),
                            @"DeploymentGroupAlreadyExistsException" : @(AWSCodedeployErrorDeploymentGroupAlreadyExists),
                            @"DeploymentGroupDoesNotExistException" : @(AWSCodedeployErrorDeploymentGroupDoesNotExist),
                            @"DeploymentGroupLimitExceededException" : @(AWSCodedeployErrorDeploymentGroupLimitExceeded),
                            @"DeploymentGroupNameRequiredException" : @(AWSCodedeployErrorDeploymentGroupNameRequired),
                            @"DeploymentIdRequiredException" : @(AWSCodedeployErrorDeploymentIdRequired),
                            @"DeploymentIsNotInReadyStateException" : @(AWSCodedeployErrorDeploymentIsNotInReadyState),
                            @"DeploymentLimitExceededException" : @(AWSCodedeployErrorDeploymentLimitExceeded),
                            @"DeploymentNotStartedException" : @(AWSCodedeployErrorDeploymentNotStarted),
                            @"DeploymentTargetDoesNotExistException" : @(AWSCodedeployErrorDeploymentTargetDoesNotExist),
                            @"DeploymentTargetIdRequiredException" : @(AWSCodedeployErrorDeploymentTargetIdRequired),
                            @"DeploymentTargetListSizeExceededException" : @(AWSCodedeployErrorDeploymentTargetListSizeExceeded),
                            @"DescriptionTooLongException" : @(AWSCodedeployErrorDescriptionTooLong),
                            @"ECSServiceMappingLimitExceededException" : @(AWSCodedeployErrorECSServiceMappingLimitExceeded),
                            @"GitHubAccountTokenDoesNotExistException" : @(AWSCodedeployErrorGitHubAccountTokenDoesNotExist),
                            @"GitHubAccountTokenNameRequiredException" : @(AWSCodedeployErrorGitHubAccountTokenNameRequired),
                            @"IamArnRequiredException" : @(AWSCodedeployErrorIamArnRequired),
                            @"IamSessionArnAlreadyRegisteredException" : @(AWSCodedeployErrorIamSessionArnAlreadyRegistered),
                            @"IamUserArnAlreadyRegisteredException" : @(AWSCodedeployErrorIamUserArnAlreadyRegistered),
                            @"IamUserArnRequiredException" : @(AWSCodedeployErrorIamUserArnRequired),
                            @"InstanceDoesNotExistException" : @(AWSCodedeployErrorInstanceDoesNotExist),
                            @"InstanceIdRequiredException" : @(AWSCodedeployErrorInstanceIdRequired),
                            @"InstanceLimitExceededException" : @(AWSCodedeployErrorInstanceLimitExceeded),
                            @"InstanceNameAlreadyRegisteredException" : @(AWSCodedeployErrorInstanceNameAlreadyRegistered),
                            @"InstanceNameRequiredException" : @(AWSCodedeployErrorInstanceNameRequired),
                            @"InstanceNotRegisteredException" : @(AWSCodedeployErrorInstanceNotRegistered),
                            @"InvalidAlarmConfigException" : @(AWSCodedeployErrorInvalidAlarmConfig),
                            @"InvalidApplicationNameException" : @(AWSCodedeployErrorInvalidApplicationName),
                            @"InvalidArnException" : @(AWSCodedeployErrorInvalidArn),
                            @"InvalidAutoRollbackConfigException" : @(AWSCodedeployErrorInvalidAutoRollbackConfig),
                            @"InvalidAutoScalingGroupException" : @(AWSCodedeployErrorInvalidAutoScalingGroup),
                            @"InvalidBlueGreenDeploymentConfigurationException" : @(AWSCodedeployErrorInvalidBlueGreenDeploymentConfiguration),
                            @"InvalidBucketNameFilterException" : @(AWSCodedeployErrorInvalidBucketNameFilter),
                            @"InvalidComputePlatformException" : @(AWSCodedeployErrorInvalidComputePlatform),
                            @"InvalidDeployedStateFilterException" : @(AWSCodedeployErrorInvalidDeployedStateFilter),
                            @"InvalidDeploymentConfigNameException" : @(AWSCodedeployErrorInvalidDeploymentConfigName),
                            @"InvalidDeploymentGroupNameException" : @(AWSCodedeployErrorInvalidDeploymentGroupName),
                            @"InvalidDeploymentIdException" : @(AWSCodedeployErrorInvalidDeploymentId),
                            @"InvalidDeploymentInstanceTypeException" : @(AWSCodedeployErrorInvalidDeploymentInstanceType),
                            @"InvalidDeploymentStatusException" : @(AWSCodedeployErrorInvalidDeploymentStatus),
                            @"InvalidDeploymentStyleException" : @(AWSCodedeployErrorInvalidDeploymentStyle),
                            @"InvalidDeploymentTargetIdException" : @(AWSCodedeployErrorInvalidDeploymentTargetId),
                            @"InvalidDeploymentWaitTypeException" : @(AWSCodedeployErrorInvalidDeploymentWaitType),
                            @"InvalidEC2TagException" : @(AWSCodedeployErrorInvalidEC2Tag),
                            @"InvalidEC2TagCombinationException" : @(AWSCodedeployErrorInvalidEC2TagCombination),
                            @"InvalidECSServiceException" : @(AWSCodedeployErrorInvalidECSService),
                            @"InvalidExternalIdException" : @(AWSCodedeployErrorInvalidExternalId),
                            @"InvalidFileExistsBehaviorException" : @(AWSCodedeployErrorInvalidFileExistsBehavior),
                            @"InvalidGitHubAccountTokenException" : @(AWSCodedeployErrorInvalidGitHubAccountToken),
                            @"InvalidGitHubAccountTokenNameException" : @(AWSCodedeployErrorInvalidGitHubAccountTokenName),
                            @"InvalidIamSessionArnException" : @(AWSCodedeployErrorInvalidIamSessionArn),
                            @"InvalidIamUserArnException" : @(AWSCodedeployErrorInvalidIamUserArn),
                            @"InvalidIgnoreApplicationStopFailuresValueException" : @(AWSCodedeployErrorInvalidIgnoreApplicationStopFailuresValue),
                            @"InvalidInputException" : @(AWSCodedeployErrorInvalidInput),
                            @"InvalidInstanceNameException" : @(AWSCodedeployErrorInvalidInstanceName),
                            @"InvalidInstanceStatusException" : @(AWSCodedeployErrorInvalidInstanceStatus),
                            @"InvalidInstanceTypeException" : @(AWSCodedeployErrorInvalidInstanceType),
                            @"InvalidKeyPrefixFilterException" : @(AWSCodedeployErrorInvalidKeyPrefixFilter),
                            @"InvalidLifecycleEventHookExecutionIdException" : @(AWSCodedeployErrorInvalidLifecycleEventHookExecutionId),
                            @"InvalidLifecycleEventHookExecutionStatusException" : @(AWSCodedeployErrorInvalidLifecycleEventHookExecutionStatus),
                            @"InvalidLoadBalancerInfoException" : @(AWSCodedeployErrorInvalidLoadBalancerInfo),
                            @"InvalidMinimumHealthyHostValueException" : @(AWSCodedeployErrorInvalidMinimumHealthyHostValue),
                            @"InvalidNextTokenException" : @(AWSCodedeployErrorInvalidNextToken),
                            @"InvalidOnPremisesTagCombinationException" : @(AWSCodedeployErrorInvalidOnPremisesTagCombination),
                            @"InvalidOperationException" : @(AWSCodedeployErrorInvalidOperation),
                            @"InvalidRegistrationStatusException" : @(AWSCodedeployErrorInvalidRegistrationStatus),
                            @"InvalidRevisionException" : @(AWSCodedeployErrorInvalidRevision),
                            @"InvalidRoleException" : @(AWSCodedeployErrorInvalidRole),
                            @"InvalidSortByException" : @(AWSCodedeployErrorInvalidSortBy),
                            @"InvalidSortOrderException" : @(AWSCodedeployErrorInvalidSortOrder),
                            @"InvalidTagException" : @(AWSCodedeployErrorInvalidTag),
                            @"InvalidTagFilterException" : @(AWSCodedeployErrorInvalidTagFilter),
                            @"InvalidTagsToAddException" : @(AWSCodedeployErrorInvalidTagsToAdd),
                            @"InvalidTargetFilterNameException" : @(AWSCodedeployErrorInvalidTargetFilterName),
                            @"InvalidTargetGroupPairException" : @(AWSCodedeployErrorInvalidTargetGroupPair),
                            @"InvalidTargetInstancesException" : @(AWSCodedeployErrorInvalidTargetInstances),
                            @"InvalidTimeRangeException" : @(AWSCodedeployErrorInvalidTimeRange),
                            @"InvalidTrafficRoutingConfigurationException" : @(AWSCodedeployErrorInvalidTrafficRoutingConfiguration),
                            @"InvalidTriggerConfigException" : @(AWSCodedeployErrorInvalidTriggerConfig),
                            @"InvalidUpdateOutdatedInstancesOnlyValueException" : @(AWSCodedeployErrorInvalidUpdateOutdatedInstancesOnlyValue),
                            @"LifecycleEventAlreadyCompletedException" : @(AWSCodedeployErrorLifecycleEventAlreadyCompleted),
                            @"LifecycleHookLimitExceededException" : @(AWSCodedeployErrorLifecycleHookLimitExceeded),
                            @"MultipleIamArnsProvidedException" : @(AWSCodedeployErrorMultipleIamArnsProvided),
                            @"OperationNotSupportedException" : @(AWSCodedeployErrorOperationNotSupported),
                            @"ResourceArnRequiredException" : @(AWSCodedeployErrorResourceArnRequired),
                            @"ResourceValidationException" : @(AWSCodedeployErrorResourceValidation),
                            @"RevisionDoesNotExistException" : @(AWSCodedeployErrorRevisionDoesNotExist),
                            @"RevisionRequiredException" : @(AWSCodedeployErrorRevisionRequired),
                            @"RoleRequiredException" : @(AWSCodedeployErrorRoleRequired),
                            @"TagLimitExceededException" : @(AWSCodedeployErrorTagLimitExceeded),
                            @"TagRequiredException" : @(AWSCodedeployErrorTagRequired),
                            @"TagSetListLimitExceededException" : @(AWSCodedeployErrorTagSetListLimitExceeded),
                            @"ThrottlingException" : @(AWSCodedeployErrorThrottling),
                            @"TriggerTargetsLimitExceededException" : @(AWSCodedeployErrorTriggerTargetsLimitExceeded),
                            @"UnsupportedActionForDeploymentTypeException" : @(AWSCodedeployErrorUnsupportedActionForDeploymentType),
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
	                *error = [NSError errorWithDomain:AWSCodedeployErrorDomain
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
        *error = [NSError errorWithDomain:AWSCodedeployErrorDomain
                                     code:AWSCodedeployErrorUnknown
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

@interface AWSCodedeployRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCodedeployRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCodedeploy()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCodedeploy

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSCodedeploySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSCodedeploy versions need to match. Check your SDK installation. AWSCore: %@ AWSCodedeploy: %@", AWSiOSSDKVersion, AWSCodedeploySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCodedeploy {
    static AWSCodedeploy *_defaultCodedeploy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCodedeploy];
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
        _defaultCodedeploy = [[AWSCodedeploy alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCodedeploy;
}

+ (void)registerCodedeployWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCodedeploy alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CodedeployForKey:(NSString *)key {
    @synchronized(self) {
        AWSCodedeploy *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCodedeploy
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCodedeploy registerCodedeployWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCodedeployForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCodedeploy` or `+ CodedeployForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCodedeploy
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCodedeploy];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCodedeployRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSCodedeployResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCodedeployResponseSerializer alloc] initWithJSONDefinition:[[AWSCodedeployResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)addTagsToOnPremisesInstances:(AWSCodedeployAddTagsToOnPremisesInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"AddTagsToOnPremisesInstances"
                   outputClass:nil];
}

- (void)addTagsToOnPremisesInstances:(AWSCodedeployAddTagsToOnPremisesInstancesInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addTagsToOnPremisesInstances:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployBatchGetApplicationRevisionsOutput *> *)batchGetApplicationRevisions:(AWSCodedeployBatchGetApplicationRevisionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"BatchGetApplicationRevisions"
                   outputClass:[AWSCodedeployBatchGetApplicationRevisionsOutput class]];
}

- (void)batchGetApplicationRevisions:(AWSCodedeployBatchGetApplicationRevisionsInput *)request
     completionHandler:(void (^)(AWSCodedeployBatchGetApplicationRevisionsOutput *response, NSError *error))completionHandler {
    [[self batchGetApplicationRevisions:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployBatchGetApplicationRevisionsOutput *> * _Nonnull task) {
        AWSCodedeployBatchGetApplicationRevisionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployBatchGetApplicationsOutput *> *)batchGetApplications:(AWSCodedeployBatchGetApplicationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"BatchGetApplications"
                   outputClass:[AWSCodedeployBatchGetApplicationsOutput class]];
}

- (void)batchGetApplications:(AWSCodedeployBatchGetApplicationsInput *)request
     completionHandler:(void (^)(AWSCodedeployBatchGetApplicationsOutput *response, NSError *error))completionHandler {
    [[self batchGetApplications:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployBatchGetApplicationsOutput *> * _Nonnull task) {
        AWSCodedeployBatchGetApplicationsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployBatchGetDeploymentGroupsOutput *> *)batchGetDeploymentGroups:(AWSCodedeployBatchGetDeploymentGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"BatchGetDeploymentGroups"
                   outputClass:[AWSCodedeployBatchGetDeploymentGroupsOutput class]];
}

- (void)batchGetDeploymentGroups:(AWSCodedeployBatchGetDeploymentGroupsInput *)request
     completionHandler:(void (^)(AWSCodedeployBatchGetDeploymentGroupsOutput *response, NSError *error))completionHandler {
    [[self batchGetDeploymentGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployBatchGetDeploymentGroupsOutput *> * _Nonnull task) {
        AWSCodedeployBatchGetDeploymentGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployBatchGetDeploymentInstancesOutput *> *)batchGetDeploymentInstances:(AWSCodedeployBatchGetDeploymentInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"BatchGetDeploymentInstances"
                   outputClass:[AWSCodedeployBatchGetDeploymentInstancesOutput class]];
}

- (void)batchGetDeploymentInstances:(AWSCodedeployBatchGetDeploymentInstancesInput *)request
     completionHandler:(void (^)(AWSCodedeployBatchGetDeploymentInstancesOutput *response, NSError *error))completionHandler {
    [[self batchGetDeploymentInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployBatchGetDeploymentInstancesOutput *> * _Nonnull task) {
        AWSCodedeployBatchGetDeploymentInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployBatchGetDeploymentTargetsOutput *> *)batchGetDeploymentTargets:(AWSCodedeployBatchGetDeploymentTargetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"BatchGetDeploymentTargets"
                   outputClass:[AWSCodedeployBatchGetDeploymentTargetsOutput class]];
}

- (void)batchGetDeploymentTargets:(AWSCodedeployBatchGetDeploymentTargetsInput *)request
     completionHandler:(void (^)(AWSCodedeployBatchGetDeploymentTargetsOutput *response, NSError *error))completionHandler {
    [[self batchGetDeploymentTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployBatchGetDeploymentTargetsOutput *> * _Nonnull task) {
        AWSCodedeployBatchGetDeploymentTargetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployBatchGetDeploymentsOutput *> *)batchGetDeployments:(AWSCodedeployBatchGetDeploymentsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"BatchGetDeployments"
                   outputClass:[AWSCodedeployBatchGetDeploymentsOutput class]];
}

- (void)batchGetDeployments:(AWSCodedeployBatchGetDeploymentsInput *)request
     completionHandler:(void (^)(AWSCodedeployBatchGetDeploymentsOutput *response, NSError *error))completionHandler {
    [[self batchGetDeployments:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployBatchGetDeploymentsOutput *> * _Nonnull task) {
        AWSCodedeployBatchGetDeploymentsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployBatchGetOnPremisesInstancesOutput *> *)batchGetOnPremisesInstances:(AWSCodedeployBatchGetOnPremisesInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"BatchGetOnPremisesInstances"
                   outputClass:[AWSCodedeployBatchGetOnPremisesInstancesOutput class]];
}

- (void)batchGetOnPremisesInstances:(AWSCodedeployBatchGetOnPremisesInstancesInput *)request
     completionHandler:(void (^)(AWSCodedeployBatchGetOnPremisesInstancesOutput *response, NSError *error))completionHandler {
    [[self batchGetOnPremisesInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployBatchGetOnPremisesInstancesOutput *> * _Nonnull task) {
        AWSCodedeployBatchGetOnPremisesInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)continueDeployment:(AWSCodedeployContinueDeploymentInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ContinueDeployment"
                   outputClass:nil];
}

- (void)continueDeployment:(AWSCodedeployContinueDeploymentInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self continueDeployment:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployCreateApplicationOutput *> *)createApplication:(AWSCodedeployCreateApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"CreateApplication"
                   outputClass:[AWSCodedeployCreateApplicationOutput class]];
}

- (void)createApplication:(AWSCodedeployCreateApplicationInput *)request
     completionHandler:(void (^)(AWSCodedeployCreateApplicationOutput *response, NSError *error))completionHandler {
    [[self createApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployCreateApplicationOutput *> * _Nonnull task) {
        AWSCodedeployCreateApplicationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployCreateDeploymentOutput *> *)createDeployment:(AWSCodedeployCreateDeploymentInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"CreateDeployment"
                   outputClass:[AWSCodedeployCreateDeploymentOutput class]];
}

- (void)createDeployment:(AWSCodedeployCreateDeploymentInput *)request
     completionHandler:(void (^)(AWSCodedeployCreateDeploymentOutput *response, NSError *error))completionHandler {
    [[self createDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployCreateDeploymentOutput *> * _Nonnull task) {
        AWSCodedeployCreateDeploymentOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployCreateDeploymentConfigOutput *> *)createDeploymentConfig:(AWSCodedeployCreateDeploymentConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"CreateDeploymentConfig"
                   outputClass:[AWSCodedeployCreateDeploymentConfigOutput class]];
}

- (void)createDeploymentConfig:(AWSCodedeployCreateDeploymentConfigInput *)request
     completionHandler:(void (^)(AWSCodedeployCreateDeploymentConfigOutput *response, NSError *error))completionHandler {
    [[self createDeploymentConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployCreateDeploymentConfigOutput *> * _Nonnull task) {
        AWSCodedeployCreateDeploymentConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployCreateDeploymentGroupOutput *> *)createDeploymentGroup:(AWSCodedeployCreateDeploymentGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"CreateDeploymentGroup"
                   outputClass:[AWSCodedeployCreateDeploymentGroupOutput class]];
}

- (void)createDeploymentGroup:(AWSCodedeployCreateDeploymentGroupInput *)request
     completionHandler:(void (^)(AWSCodedeployCreateDeploymentGroupOutput *response, NSError *error))completionHandler {
    [[self createDeploymentGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployCreateDeploymentGroupOutput *> * _Nonnull task) {
        AWSCodedeployCreateDeploymentGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApplication:(AWSCodedeployDeleteApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"DeleteApplication"
                   outputClass:nil];
}

- (void)deleteApplication:(AWSCodedeployDeleteApplicationInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApplication:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDeploymentConfig:(AWSCodedeployDeleteDeploymentConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"DeleteDeploymentConfig"
                   outputClass:nil];
}

- (void)deleteDeploymentConfig:(AWSCodedeployDeleteDeploymentConfigInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDeploymentConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployDeleteDeploymentGroupOutput *> *)deleteDeploymentGroup:(AWSCodedeployDeleteDeploymentGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"DeleteDeploymentGroup"
                   outputClass:[AWSCodedeployDeleteDeploymentGroupOutput class]];
}

- (void)deleteDeploymentGroup:(AWSCodedeployDeleteDeploymentGroupInput *)request
     completionHandler:(void (^)(AWSCodedeployDeleteDeploymentGroupOutput *response, NSError *error))completionHandler {
    [[self deleteDeploymentGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployDeleteDeploymentGroupOutput *> * _Nonnull task) {
        AWSCodedeployDeleteDeploymentGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployDeleteGitHubAccountTokenOutput *> *)deleteGitHubAccountToken:(AWSCodedeployDeleteGitHubAccountTokenInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"DeleteGitHubAccountToken"
                   outputClass:[AWSCodedeployDeleteGitHubAccountTokenOutput class]];
}

- (void)deleteGitHubAccountToken:(AWSCodedeployDeleteGitHubAccountTokenInput *)request
     completionHandler:(void (^)(AWSCodedeployDeleteGitHubAccountTokenOutput *response, NSError *error))completionHandler {
    [[self deleteGitHubAccountToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployDeleteGitHubAccountTokenOutput *> * _Nonnull task) {
        AWSCodedeployDeleteGitHubAccountTokenOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployDeleteResourcesByExternalIdOutput *> *)deleteResourcesByExternalId:(AWSCodedeployDeleteResourcesByExternalIdInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"DeleteResourcesByExternalId"
                   outputClass:[AWSCodedeployDeleteResourcesByExternalIdOutput class]];
}

- (void)deleteResourcesByExternalId:(AWSCodedeployDeleteResourcesByExternalIdInput *)request
     completionHandler:(void (^)(AWSCodedeployDeleteResourcesByExternalIdOutput *response, NSError *error))completionHandler {
    [[self deleteResourcesByExternalId:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployDeleteResourcesByExternalIdOutput *> * _Nonnull task) {
        AWSCodedeployDeleteResourcesByExternalIdOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deregisterOnPremisesInstance:(AWSCodedeployDeregisterOnPremisesInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"DeregisterOnPremisesInstance"
                   outputClass:nil];
}

- (void)deregisterOnPremisesInstance:(AWSCodedeployDeregisterOnPremisesInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deregisterOnPremisesInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployGetApplicationOutput *> *)getApplication:(AWSCodedeployGetApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"GetApplication"
                   outputClass:[AWSCodedeployGetApplicationOutput class]];
}

- (void)getApplication:(AWSCodedeployGetApplicationInput *)request
     completionHandler:(void (^)(AWSCodedeployGetApplicationOutput *response, NSError *error))completionHandler {
    [[self getApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployGetApplicationOutput *> * _Nonnull task) {
        AWSCodedeployGetApplicationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployGetApplicationRevisionOutput *> *)getApplicationRevision:(AWSCodedeployGetApplicationRevisionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"GetApplicationRevision"
                   outputClass:[AWSCodedeployGetApplicationRevisionOutput class]];
}

- (void)getApplicationRevision:(AWSCodedeployGetApplicationRevisionInput *)request
     completionHandler:(void (^)(AWSCodedeployGetApplicationRevisionOutput *response, NSError *error))completionHandler {
    [[self getApplicationRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployGetApplicationRevisionOutput *> * _Nonnull task) {
        AWSCodedeployGetApplicationRevisionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployGetDeploymentOutput *> *)getDeployment:(AWSCodedeployGetDeploymentInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"GetDeployment"
                   outputClass:[AWSCodedeployGetDeploymentOutput class]];
}

- (void)getDeployment:(AWSCodedeployGetDeploymentInput *)request
     completionHandler:(void (^)(AWSCodedeployGetDeploymentOutput *response, NSError *error))completionHandler {
    [[self getDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployGetDeploymentOutput *> * _Nonnull task) {
        AWSCodedeployGetDeploymentOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployGetDeploymentConfigOutput *> *)getDeploymentConfig:(AWSCodedeployGetDeploymentConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"GetDeploymentConfig"
                   outputClass:[AWSCodedeployGetDeploymentConfigOutput class]];
}

- (void)getDeploymentConfig:(AWSCodedeployGetDeploymentConfigInput *)request
     completionHandler:(void (^)(AWSCodedeployGetDeploymentConfigOutput *response, NSError *error))completionHandler {
    [[self getDeploymentConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployGetDeploymentConfigOutput *> * _Nonnull task) {
        AWSCodedeployGetDeploymentConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployGetDeploymentGroupOutput *> *)getDeploymentGroup:(AWSCodedeployGetDeploymentGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"GetDeploymentGroup"
                   outputClass:[AWSCodedeployGetDeploymentGroupOutput class]];
}

- (void)getDeploymentGroup:(AWSCodedeployGetDeploymentGroupInput *)request
     completionHandler:(void (^)(AWSCodedeployGetDeploymentGroupOutput *response, NSError *error))completionHandler {
    [[self getDeploymentGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployGetDeploymentGroupOutput *> * _Nonnull task) {
        AWSCodedeployGetDeploymentGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployGetDeploymentInstanceOutput *> *)getDeploymentInstance:(AWSCodedeployGetDeploymentInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"GetDeploymentInstance"
                   outputClass:[AWSCodedeployGetDeploymentInstanceOutput class]];
}

- (void)getDeploymentInstance:(AWSCodedeployGetDeploymentInstanceInput *)request
     completionHandler:(void (^)(AWSCodedeployGetDeploymentInstanceOutput *response, NSError *error))completionHandler {
    [[self getDeploymentInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployGetDeploymentInstanceOutput *> * _Nonnull task) {
        AWSCodedeployGetDeploymentInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployGetDeploymentTargetOutput *> *)getDeploymentTarget:(AWSCodedeployGetDeploymentTargetInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"GetDeploymentTarget"
                   outputClass:[AWSCodedeployGetDeploymentTargetOutput class]];
}

- (void)getDeploymentTarget:(AWSCodedeployGetDeploymentTargetInput *)request
     completionHandler:(void (^)(AWSCodedeployGetDeploymentTargetOutput *response, NSError *error))completionHandler {
    [[self getDeploymentTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployGetDeploymentTargetOutput *> * _Nonnull task) {
        AWSCodedeployGetDeploymentTargetOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployGetOnPremisesInstanceOutput *> *)getOnPremisesInstance:(AWSCodedeployGetOnPremisesInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"GetOnPremisesInstance"
                   outputClass:[AWSCodedeployGetOnPremisesInstanceOutput class]];
}

- (void)getOnPremisesInstance:(AWSCodedeployGetOnPremisesInstanceInput *)request
     completionHandler:(void (^)(AWSCodedeployGetOnPremisesInstanceOutput *response, NSError *error))completionHandler {
    [[self getOnPremisesInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployGetOnPremisesInstanceOutput *> * _Nonnull task) {
        AWSCodedeployGetOnPremisesInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListApplicationRevisionsOutput *> *)listApplicationRevisions:(AWSCodedeployListApplicationRevisionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListApplicationRevisions"
                   outputClass:[AWSCodedeployListApplicationRevisionsOutput class]];
}

- (void)listApplicationRevisions:(AWSCodedeployListApplicationRevisionsInput *)request
     completionHandler:(void (^)(AWSCodedeployListApplicationRevisionsOutput *response, NSError *error))completionHandler {
    [[self listApplicationRevisions:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListApplicationRevisionsOutput *> * _Nonnull task) {
        AWSCodedeployListApplicationRevisionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListApplicationsOutput *> *)listApplications:(AWSCodedeployListApplicationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListApplications"
                   outputClass:[AWSCodedeployListApplicationsOutput class]];
}

- (void)listApplications:(AWSCodedeployListApplicationsInput *)request
     completionHandler:(void (^)(AWSCodedeployListApplicationsOutput *response, NSError *error))completionHandler {
    [[self listApplications:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListApplicationsOutput *> * _Nonnull task) {
        AWSCodedeployListApplicationsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListDeploymentConfigsOutput *> *)listDeploymentConfigs:(AWSCodedeployListDeploymentConfigsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListDeploymentConfigs"
                   outputClass:[AWSCodedeployListDeploymentConfigsOutput class]];
}

- (void)listDeploymentConfigs:(AWSCodedeployListDeploymentConfigsInput *)request
     completionHandler:(void (^)(AWSCodedeployListDeploymentConfigsOutput *response, NSError *error))completionHandler {
    [[self listDeploymentConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListDeploymentConfigsOutput *> * _Nonnull task) {
        AWSCodedeployListDeploymentConfigsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListDeploymentGroupsOutput *> *)listDeploymentGroups:(AWSCodedeployListDeploymentGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListDeploymentGroups"
                   outputClass:[AWSCodedeployListDeploymentGroupsOutput class]];
}

- (void)listDeploymentGroups:(AWSCodedeployListDeploymentGroupsInput *)request
     completionHandler:(void (^)(AWSCodedeployListDeploymentGroupsOutput *response, NSError *error))completionHandler {
    [[self listDeploymentGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListDeploymentGroupsOutput *> * _Nonnull task) {
        AWSCodedeployListDeploymentGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListDeploymentInstancesOutput *> *)listDeploymentInstances:(AWSCodedeployListDeploymentInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListDeploymentInstances"
                   outputClass:[AWSCodedeployListDeploymentInstancesOutput class]];
}

- (void)listDeploymentInstances:(AWSCodedeployListDeploymentInstancesInput *)request
     completionHandler:(void (^)(AWSCodedeployListDeploymentInstancesOutput *response, NSError *error))completionHandler {
    [[self listDeploymentInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListDeploymentInstancesOutput *> * _Nonnull task) {
        AWSCodedeployListDeploymentInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListDeploymentTargetsOutput *> *)listDeploymentTargets:(AWSCodedeployListDeploymentTargetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListDeploymentTargets"
                   outputClass:[AWSCodedeployListDeploymentTargetsOutput class]];
}

- (void)listDeploymentTargets:(AWSCodedeployListDeploymentTargetsInput *)request
     completionHandler:(void (^)(AWSCodedeployListDeploymentTargetsOutput *response, NSError *error))completionHandler {
    [[self listDeploymentTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListDeploymentTargetsOutput *> * _Nonnull task) {
        AWSCodedeployListDeploymentTargetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListDeploymentsOutput *> *)listDeployments:(AWSCodedeployListDeploymentsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListDeployments"
                   outputClass:[AWSCodedeployListDeploymentsOutput class]];
}

- (void)listDeployments:(AWSCodedeployListDeploymentsInput *)request
     completionHandler:(void (^)(AWSCodedeployListDeploymentsOutput *response, NSError *error))completionHandler {
    [[self listDeployments:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListDeploymentsOutput *> * _Nonnull task) {
        AWSCodedeployListDeploymentsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListGitHubAccountTokenNamesOutput *> *)listGitHubAccountTokenNames:(AWSCodedeployListGitHubAccountTokenNamesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListGitHubAccountTokenNames"
                   outputClass:[AWSCodedeployListGitHubAccountTokenNamesOutput class]];
}

- (void)listGitHubAccountTokenNames:(AWSCodedeployListGitHubAccountTokenNamesInput *)request
     completionHandler:(void (^)(AWSCodedeployListGitHubAccountTokenNamesOutput *response, NSError *error))completionHandler {
    [[self listGitHubAccountTokenNames:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListGitHubAccountTokenNamesOutput *> * _Nonnull task) {
        AWSCodedeployListGitHubAccountTokenNamesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListOnPremisesInstancesOutput *> *)listOnPremisesInstances:(AWSCodedeployListOnPremisesInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListOnPremisesInstances"
                   outputClass:[AWSCodedeployListOnPremisesInstancesOutput class]];
}

- (void)listOnPremisesInstances:(AWSCodedeployListOnPremisesInstancesInput *)request
     completionHandler:(void (^)(AWSCodedeployListOnPremisesInstancesOutput *response, NSError *error))completionHandler {
    [[self listOnPremisesInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListOnPremisesInstancesOutput *> * _Nonnull task) {
        AWSCodedeployListOnPremisesInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployListTagsForResourceOutput *> *)listTagsForResource:(AWSCodedeployListTagsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSCodedeployListTagsForResourceOutput class]];
}

- (void)listTagsForResource:(AWSCodedeployListTagsForResourceInput *)request
     completionHandler:(void (^)(AWSCodedeployListTagsForResourceOutput *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployListTagsForResourceOutput *> * _Nonnull task) {
        AWSCodedeployListTagsForResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployPutLifecycleEventHookExecutionStatusOutput *> *)putLifecycleEventHookExecutionStatus:(AWSCodedeployPutLifecycleEventHookExecutionStatusInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"PutLifecycleEventHookExecutionStatus"
                   outputClass:[AWSCodedeployPutLifecycleEventHookExecutionStatusOutput class]];
}

- (void)putLifecycleEventHookExecutionStatus:(AWSCodedeployPutLifecycleEventHookExecutionStatusInput *)request
     completionHandler:(void (^)(AWSCodedeployPutLifecycleEventHookExecutionStatusOutput *response, NSError *error))completionHandler {
    [[self putLifecycleEventHookExecutionStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployPutLifecycleEventHookExecutionStatusOutput *> * _Nonnull task) {
        AWSCodedeployPutLifecycleEventHookExecutionStatusOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)registerApplicationRevision:(AWSCodedeployRegisterApplicationRevisionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"RegisterApplicationRevision"
                   outputClass:nil];
}

- (void)registerApplicationRevision:(AWSCodedeployRegisterApplicationRevisionInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self registerApplicationRevision:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)registerOnPremisesInstance:(AWSCodedeployRegisterOnPremisesInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"RegisterOnPremisesInstance"
                   outputClass:nil];
}

- (void)registerOnPremisesInstance:(AWSCodedeployRegisterOnPremisesInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self registerOnPremisesInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)removeTagsFromOnPremisesInstances:(AWSCodedeployRemoveTagsFromOnPremisesInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"RemoveTagsFromOnPremisesInstances"
                   outputClass:nil];
}

- (void)removeTagsFromOnPremisesInstances:(AWSCodedeployRemoveTagsFromOnPremisesInstancesInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeTagsFromOnPremisesInstances:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)skipWaitTimeForInstanceTermination:(AWSCodedeploySkipWaitTimeForInstanceTerminationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"SkipWaitTimeForInstanceTermination"
                   outputClass:nil];
}

- (void)skipWaitTimeForInstanceTermination:(AWSCodedeploySkipWaitTimeForInstanceTerminationInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self skipWaitTimeForInstanceTermination:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployStopDeploymentOutput *> *)stopDeployment:(AWSCodedeployStopDeploymentInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"StopDeployment"
                   outputClass:[AWSCodedeployStopDeploymentOutput class]];
}

- (void)stopDeployment:(AWSCodedeployStopDeploymentInput *)request
     completionHandler:(void (^)(AWSCodedeployStopDeploymentOutput *response, NSError *error))completionHandler {
    [[self stopDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployStopDeploymentOutput *> * _Nonnull task) {
        AWSCodedeployStopDeploymentOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployTagResourceOutput *> *)tagResource:(AWSCodedeployTagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"TagResource"
                   outputClass:[AWSCodedeployTagResourceOutput class]];
}

- (void)tagResource:(AWSCodedeployTagResourceInput *)request
     completionHandler:(void (^)(AWSCodedeployTagResourceOutput *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployTagResourceOutput *> * _Nonnull task) {
        AWSCodedeployTagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployUntagResourceOutput *> *)untagResource:(AWSCodedeployUntagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"UntagResource"
                   outputClass:[AWSCodedeployUntagResourceOutput class]];
}

- (void)untagResource:(AWSCodedeployUntagResourceInput *)request
     completionHandler:(void (^)(AWSCodedeployUntagResourceOutput *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployUntagResourceOutput *> * _Nonnull task) {
        AWSCodedeployUntagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateApplication:(AWSCodedeployUpdateApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"UpdateApplication"
                   outputClass:nil];
}

- (void)updateApplication:(AWSCodedeployUpdateApplicationInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateApplication:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodedeployUpdateDeploymentGroupOutput *> *)updateDeploymentGroup:(AWSCodedeployUpdateDeploymentGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"CodeDeploy_20141006"
                 operationName:@"UpdateDeploymentGroup"
                   outputClass:[AWSCodedeployUpdateDeploymentGroupOutput class]];
}

- (void)updateDeploymentGroup:(AWSCodedeployUpdateDeploymentGroupInput *)request
     completionHandler:(void (^)(AWSCodedeployUpdateDeploymentGroupOutput *response, NSError *error))completionHandler {
    [[self updateDeploymentGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodedeployUpdateDeploymentGroupOutput *> * _Nonnull task) {
        AWSCodedeployUpdateDeploymentGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
