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

#import "AWSAWSS3ControlService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAWSS3ControlResources.h"

static NSString *const AWSInfoAWSS3Control = @"AWSS3Control";
NSString *const AWSAWSS3ControlSDKVersion = @"2.13.3";


@interface AWSAWSS3ControlResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSAWSS3ControlResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSAWSS3ControlErrorBadRequest),
                            @"IdempotencyException" : @(AWSAWSS3ControlErrorIdempotency),
                            @"InternalServiceException" : @(AWSAWSS3ControlErrorInternalService),
                            @"InvalidNextTokenException" : @(AWSAWSS3ControlErrorInvalidNextToken),
                            @"InvalidRequestException" : @(AWSAWSS3ControlErrorInvalidRequest),
                            @"JobStatusException" : @(AWSAWSS3ControlErrorJobStatus),
                            @"NoSuchPublicAccessBlockConfiguration" : @(AWSAWSS3ControlErrorNoSuchPublicAccessBlockConfiguration),
                            @"NotFoundException" : @(AWSAWSS3ControlErrorNotFound),
                            @"TooManyRequestsException" : @(AWSAWSS3ControlErrorTooManyRequests),
                            @"TooManyTagsException" : @(AWSAWSS3ControlErrorTooManyTags),
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
	                *error = [NSError errorWithDomain:AWSAWSS3ControlErrorDomain
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
        *error = [NSError errorWithDomain:AWSAWSS3ControlErrorDomain
                                     code:AWSAWSS3ControlErrorUnknown
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

@interface AWSAWSS3ControlRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAWSS3ControlRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAWSS3Control()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAWSS3Control

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAWSS3ControlSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAWSS3Control versions need to match. Check your SDK installation. AWSCore: %@ AWSAWSS3Control: %@", AWSiOSSDKVersion, AWSAWSS3ControlSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAWSS3Control {
    static AWSAWSS3Control *_defaultAWSS3Control = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAWSS3Control];
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
        _defaultAWSS3Control = [[AWSAWSS3Control alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAWSS3Control;
}

+ (void)registerAWSS3ControlWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAWSS3Control alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AWSS3ControlForKey:(NSString *)key {
    @synchronized(self) {
        AWSAWSS3Control *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAWSS3Control
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAWSS3Control registerAWSS3ControlWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAWSS3ControlForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAWSS3Control` or `+ AWSS3ControlForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAWSS3Control
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAWSS3Control];
        }
       	
        
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAWSS3ControlRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSXMLRequestSerializer alloc] initWithJSONDefinition:[[AWSAWSS3ControlResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAWSS3ControlResponseSerializer alloc] initWithJSONDefinition:[[AWSAWSS3ControlResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)createAccessPoint:(AWSAWSS3ControlCreateAccessPointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20180820/accesspoint/{name}"
                  targetPrefix:@""
                 operationName:@"CreateAccessPoint"
                   outputClass:nil];
}

- (void)createAccessPoint:(AWSAWSS3ControlCreateAccessPointRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createAccessPoint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlCreateJobResult *> *)createJob:(AWSAWSS3ControlCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v20180820/jobs"
                  targetPrefix:@""
                 operationName:@"CreateJob"
                   outputClass:[AWSAWSS3ControlCreateJobResult class]];
}

- (void)createJob:(AWSAWSS3ControlCreateJobRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlCreateJobResult *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlCreateJobResult *> * _Nonnull task) {
        AWSAWSS3ControlCreateJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAccessPoint:(AWSAWSS3ControlDeleteAccessPointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v20180820/accesspoint/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteAccessPoint"
                   outputClass:nil];
}

- (void)deleteAccessPoint:(AWSAWSS3ControlDeleteAccessPointRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAccessPoint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAccessPointPolicy:(AWSAWSS3ControlDeleteAccessPointPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v20180820/accesspoint/{name}/policy"
                  targetPrefix:@""
                 operationName:@"DeleteAccessPointPolicy"
                   outputClass:nil];
}

- (void)deleteAccessPointPolicy:(AWSAWSS3ControlDeleteAccessPointPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAccessPointPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlDeleteJobTaggingResult *> *)deleteJobTagging:(AWSAWSS3ControlDeleteJobTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v20180820/jobs/{id}/tagging"
                  targetPrefix:@""
                 operationName:@"DeleteJobTagging"
                   outputClass:[AWSAWSS3ControlDeleteJobTaggingResult class]];
}

- (void)deleteJobTagging:(AWSAWSS3ControlDeleteJobTaggingRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlDeleteJobTaggingResult *response, NSError *error))completionHandler {
    [[self deleteJobTagging:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlDeleteJobTaggingResult *> * _Nonnull task) {
        AWSAWSS3ControlDeleteJobTaggingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePublicAccessBlock:(AWSAWSS3ControlDeletePublicAccessBlockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v20180820/configuration/publicAccessBlock"
                  targetPrefix:@""
                 operationName:@"DeletePublicAccessBlock"
                   outputClass:nil];
}

- (void)deletePublicAccessBlock:(AWSAWSS3ControlDeletePublicAccessBlockRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePublicAccessBlock:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlDescribeJobResult *> *)describeJob:(AWSAWSS3ControlDescribeJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20180820/jobs/{id}"
                  targetPrefix:@""
                 operationName:@"DescribeJob"
                   outputClass:[AWSAWSS3ControlDescribeJobResult class]];
}

- (void)describeJob:(AWSAWSS3ControlDescribeJobRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlDescribeJobResult *response, NSError *error))completionHandler {
    [[self describeJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlDescribeJobResult *> * _Nonnull task) {
        AWSAWSS3ControlDescribeJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlGetAccessPointResult *> *)getAccessPoint:(AWSAWSS3ControlGetAccessPointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20180820/accesspoint/{name}"
                  targetPrefix:@""
                 operationName:@"GetAccessPoint"
                   outputClass:[AWSAWSS3ControlGetAccessPointResult class]];
}

- (void)getAccessPoint:(AWSAWSS3ControlGetAccessPointRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlGetAccessPointResult *response, NSError *error))completionHandler {
    [[self getAccessPoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlGetAccessPointResult *> * _Nonnull task) {
        AWSAWSS3ControlGetAccessPointResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlGetAccessPointPolicyResult *> *)getAccessPointPolicy:(AWSAWSS3ControlGetAccessPointPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20180820/accesspoint/{name}/policy"
                  targetPrefix:@""
                 operationName:@"GetAccessPointPolicy"
                   outputClass:[AWSAWSS3ControlGetAccessPointPolicyResult class]];
}

- (void)getAccessPointPolicy:(AWSAWSS3ControlGetAccessPointPolicyRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlGetAccessPointPolicyResult *response, NSError *error))completionHandler {
    [[self getAccessPointPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlGetAccessPointPolicyResult *> * _Nonnull task) {
        AWSAWSS3ControlGetAccessPointPolicyResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlGetAccessPointPolicyStatusResult *> *)getAccessPointPolicyStatus:(AWSAWSS3ControlGetAccessPointPolicyStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20180820/accesspoint/{name}/policyStatus"
                  targetPrefix:@""
                 operationName:@"GetAccessPointPolicyStatus"
                   outputClass:[AWSAWSS3ControlGetAccessPointPolicyStatusResult class]];
}

- (void)getAccessPointPolicyStatus:(AWSAWSS3ControlGetAccessPointPolicyStatusRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlGetAccessPointPolicyStatusResult *response, NSError *error))completionHandler {
    [[self getAccessPointPolicyStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlGetAccessPointPolicyStatusResult *> * _Nonnull task) {
        AWSAWSS3ControlGetAccessPointPolicyStatusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlGetJobTaggingResult *> *)getJobTagging:(AWSAWSS3ControlGetJobTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20180820/jobs/{id}/tagging"
                  targetPrefix:@""
                 operationName:@"GetJobTagging"
                   outputClass:[AWSAWSS3ControlGetJobTaggingResult class]];
}

- (void)getJobTagging:(AWSAWSS3ControlGetJobTaggingRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlGetJobTaggingResult *response, NSError *error))completionHandler {
    [[self getJobTagging:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlGetJobTaggingResult *> * _Nonnull task) {
        AWSAWSS3ControlGetJobTaggingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlGetPublicAccessBlockOutput *> *)getPublicAccessBlock:(AWSAWSS3ControlGetPublicAccessBlockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20180820/configuration/publicAccessBlock"
                  targetPrefix:@""
                 operationName:@"GetPublicAccessBlock"
                   outputClass:[AWSAWSS3ControlGetPublicAccessBlockOutput class]];
}

- (void)getPublicAccessBlock:(AWSAWSS3ControlGetPublicAccessBlockRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlGetPublicAccessBlockOutput *response, NSError *error))completionHandler {
    [[self getPublicAccessBlock:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlGetPublicAccessBlockOutput *> * _Nonnull task) {
        AWSAWSS3ControlGetPublicAccessBlockOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlListAccessPointsResult *> *)listAccessPoints:(AWSAWSS3ControlListAccessPointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20180820/accesspoint"
                  targetPrefix:@""
                 operationName:@"ListAccessPoints"
                   outputClass:[AWSAWSS3ControlListAccessPointsResult class]];
}

- (void)listAccessPoints:(AWSAWSS3ControlListAccessPointsRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlListAccessPointsResult *response, NSError *error))completionHandler {
    [[self listAccessPoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlListAccessPointsResult *> * _Nonnull task) {
        AWSAWSS3ControlListAccessPointsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlListJobsResult *> *)listJobs:(AWSAWSS3ControlListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20180820/jobs"
                  targetPrefix:@""
                 operationName:@"ListJobs"
                   outputClass:[AWSAWSS3ControlListJobsResult class]];
}

- (void)listJobs:(AWSAWSS3ControlListJobsRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlListJobsResult *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlListJobsResult *> * _Nonnull task) {
        AWSAWSS3ControlListJobsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putAccessPointPolicy:(AWSAWSS3ControlPutAccessPointPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20180820/accesspoint/{name}/policy"
                  targetPrefix:@""
                 operationName:@"PutAccessPointPolicy"
                   outputClass:nil];
}

- (void)putAccessPointPolicy:(AWSAWSS3ControlPutAccessPointPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putAccessPointPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlPutJobTaggingResult *> *)putJobTagging:(AWSAWSS3ControlPutJobTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20180820/jobs/{id}/tagging"
                  targetPrefix:@""
                 operationName:@"PutJobTagging"
                   outputClass:[AWSAWSS3ControlPutJobTaggingResult class]];
}

- (void)putJobTagging:(AWSAWSS3ControlPutJobTaggingRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlPutJobTaggingResult *response, NSError *error))completionHandler {
    [[self putJobTagging:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlPutJobTaggingResult *> * _Nonnull task) {
        AWSAWSS3ControlPutJobTaggingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putPublicAccessBlock:(AWSAWSS3ControlPutPublicAccessBlockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20180820/configuration/publicAccessBlock"
                  targetPrefix:@""
                 operationName:@"PutPublicAccessBlock"
                   outputClass:nil];
}

- (void)putPublicAccessBlock:(AWSAWSS3ControlPutPublicAccessBlockRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putPublicAccessBlock:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlUpdateJobPriorityResult *> *)updateJobPriority:(AWSAWSS3ControlUpdateJobPriorityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v20180820/jobs/{id}/priority"
                  targetPrefix:@""
                 operationName:@"UpdateJobPriority"
                   outputClass:[AWSAWSS3ControlUpdateJobPriorityResult class]];
}

- (void)updateJobPriority:(AWSAWSS3ControlUpdateJobPriorityRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlUpdateJobPriorityResult *response, NSError *error))completionHandler {
    [[self updateJobPriority:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlUpdateJobPriorityResult *> * _Nonnull task) {
        AWSAWSS3ControlUpdateJobPriorityResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSS3ControlUpdateJobStatusResult *> *)updateJobStatus:(AWSAWSS3ControlUpdateJobStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v20180820/jobs/{id}/status"
                  targetPrefix:@""
                 operationName:@"UpdateJobStatus"
                   outputClass:[AWSAWSS3ControlUpdateJobStatusResult class]];
}

- (void)updateJobStatus:(AWSAWSS3ControlUpdateJobStatusRequest *)request
     completionHandler:(void (^)(AWSAWSS3ControlUpdateJobStatusResult *response, NSError *error))completionHandler {
    [[self updateJobStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSS3ControlUpdateJobStatusResult *> * _Nonnull task) {
        AWSAWSS3ControlUpdateJobStatusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
