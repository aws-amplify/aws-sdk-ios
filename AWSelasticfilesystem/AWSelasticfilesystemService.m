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

#import "AWSelasticfilesystemService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSelasticfilesystemResources.h"

static NSString *const AWSInfoelasticfilesystem = @"elasticfilesystem";
NSString *const AWSelasticfilesystemSDKVersion = @"2.13.3";


@interface AWSelasticfilesystemResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSelasticfilesystemResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessPointAlreadyExists" : @(AWSelasticfilesystemErrorAccessPointAlreadyExists),
                            @"AccessPointLimitExceeded" : @(AWSelasticfilesystemErrorAccessPointLimitExceeded),
                            @"AccessPointNotFound" : @(AWSelasticfilesystemErrorAccessPointNotFound),
                            @"BadRequest" : @(AWSelasticfilesystemErrorBadRequest),
                            @"DependencyTimeout" : @(AWSelasticfilesystemErrorDependencyTimeout),
                            @"FileSystemAlreadyExists" : @(AWSelasticfilesystemErrorFileSystemAlreadyExists),
                            @"FileSystemInUse" : @(AWSelasticfilesystemErrorFileSystemInUse),
                            @"FileSystemLimitExceeded" : @(AWSelasticfilesystemErrorFileSystemLimitExceeded),
                            @"FileSystemNotFound" : @(AWSelasticfilesystemErrorFileSystemNotFound),
                            @"IncorrectFileSystemLifeCycleState" : @(AWSelasticfilesystemErrorIncorrectFileSystemLifeCycleState),
                            @"IncorrectMountTargetState" : @(AWSelasticfilesystemErrorIncorrectMountTargetState),
                            @"InsufficientThroughputCapacity" : @(AWSelasticfilesystemErrorInsufficientThroughputCapacity),
                            @"InternalServerError" : @(AWSelasticfilesystemErrorInternalServer),
                            @"InvalidPolicyException" : @(AWSelasticfilesystemErrorInvalidPolicy),
                            @"IpAddressInUse" : @(AWSelasticfilesystemErrorIpAddressInUse),
                            @"MountTargetConflict" : @(AWSelasticfilesystemErrorMountTargetConflict),
                            @"MountTargetNotFound" : @(AWSelasticfilesystemErrorMountTargetNotFound),
                            @"NetworkInterfaceLimitExceeded" : @(AWSelasticfilesystemErrorNetworkInterfaceLimitExceeded),
                            @"NoFreeAddressesInSubnet" : @(AWSelasticfilesystemErrorNoFreeAddressesInSubnet),
                            @"PolicyNotFound" : @(AWSelasticfilesystemErrorPolicyNotFound),
                            @"SecurityGroupLimitExceeded" : @(AWSelasticfilesystemErrorSecurityGroupLimitExceeded),
                            @"SecurityGroupNotFound" : @(AWSelasticfilesystemErrorSecurityGroupNotFound),
                            @"SubnetNotFound" : @(AWSelasticfilesystemErrorSubnetNotFound),
                            @"ThroughputLimitExceeded" : @(AWSelasticfilesystemErrorThroughputLimitExceeded),
                            @"TooManyRequests" : @(AWSelasticfilesystemErrorTooManyRequests),
                            @"UnsupportedAvailabilityZone" : @(AWSelasticfilesystemErrorUnsupportedAvailabilityZone),
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
    	NSString *errorTypeString = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeString componentsSeparatedByString:@":"] firstObject];

        if ([errorTypeString length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSelasticfilesystemErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSelasticfilesystemErrorDomain
                                                 code:AWSelasticfilesystemErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSelasticfilesystemErrorDomain
                                     code:AWSelasticfilesystemErrorUnknown
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

@interface AWSelasticfilesystemRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSelasticfilesystemRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSelasticfilesystem()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSelasticfilesystem

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSelasticfilesystemSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSelasticfilesystem versions need to match. Check your SDK installation. AWSCore: %@ AWSelasticfilesystem: %@", AWSiOSSDKVersion, AWSelasticfilesystemSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultelasticfilesystem {
    static AWSelasticfilesystem *_defaultelasticfilesystem = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoelasticfilesystem];
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
        _defaultelasticfilesystem = [[AWSelasticfilesystem alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultelasticfilesystem;
}

+ (void)registerelasticfilesystemWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSelasticfilesystem alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)elasticfilesystemForKey:(NSString *)key {
    @synchronized(self) {
        AWSelasticfilesystem *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoelasticfilesystem
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeelasticfilesystemForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultelasticfilesystem` or `+ elasticfilesystemForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceelasticfilesystem
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceelasticfilesystem];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSelasticfilesystemRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.0"}; 
		
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSelasticfilesystemResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSelasticfilesystemResponseSerializer alloc] initWithJSONDefinition:[[AWSelasticfilesystemResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSelasticfilesystemAccessPointDescription *> *)createAccessPoint:(AWSelasticfilesystemCreateAccessPointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-02-01/access-points"
                  targetPrefix:@""
                 operationName:@"CreateAccessPoint"
                   outputClass:[AWSelasticfilesystemAccessPointDescription class]];
}

- (void)createAccessPoint:(AWSelasticfilesystemCreateAccessPointRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemAccessPointDescription *response, NSError *error))completionHandler {
    [[self createAccessPoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemAccessPointDescription *> * _Nonnull task) {
        AWSelasticfilesystemAccessPointDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemFileSystemDescription *> *)createFileSystem:(AWSelasticfilesystemCreateFileSystemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-02-01/file-systems"
                  targetPrefix:@""
                 operationName:@"CreateFileSystem"
                   outputClass:[AWSelasticfilesystemFileSystemDescription class]];
}

- (void)createFileSystem:(AWSelasticfilesystemCreateFileSystemRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemFileSystemDescription *response, NSError *error))completionHandler {
    [[self createFileSystem:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemFileSystemDescription *> * _Nonnull task) {
        AWSelasticfilesystemFileSystemDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemMountTargetDescription *> *)createMountTarget:(AWSelasticfilesystemCreateMountTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-02-01/mount-targets"
                  targetPrefix:@""
                 operationName:@"CreateMountTarget"
                   outputClass:[AWSelasticfilesystemMountTargetDescription class]];
}

- (void)createMountTarget:(AWSelasticfilesystemCreateMountTargetRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemMountTargetDescription *response, NSError *error))completionHandler {
    [[self createMountTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemMountTargetDescription *> * _Nonnull task) {
        AWSelasticfilesystemMountTargetDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createTags:(AWSelasticfilesystemCreateTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-02-01/create-tags/{FileSystemId}"
                  targetPrefix:@""
                 operationName:@"CreateTags"
                   outputClass:nil];
}

- (void)createTags:(AWSelasticfilesystemCreateTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAccessPoint:(AWSelasticfilesystemDeleteAccessPointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-02-01/access-points/{AccessPointId}"
                  targetPrefix:@""
                 operationName:@"DeleteAccessPoint"
                   outputClass:nil];
}

- (void)deleteAccessPoint:(AWSelasticfilesystemDeleteAccessPointRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAccessPoint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteFileSystem:(AWSelasticfilesystemDeleteFileSystemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-02-01/file-systems/{FileSystemId}"
                  targetPrefix:@""
                 operationName:@"DeleteFileSystem"
                   outputClass:nil];
}

- (void)deleteFileSystem:(AWSelasticfilesystemDeleteFileSystemRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteFileSystem:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteFileSystemPolicy:(AWSelasticfilesystemDeleteFileSystemPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-02-01/file-systems/{FileSystemId}/policy"
                  targetPrefix:@""
                 operationName:@"DeleteFileSystemPolicy"
                   outputClass:nil];
}

- (void)deleteFileSystemPolicy:(AWSelasticfilesystemDeleteFileSystemPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteFileSystemPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteMountTarget:(AWSelasticfilesystemDeleteMountTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-02-01/mount-targets/{MountTargetId}"
                  targetPrefix:@""
                 operationName:@"DeleteMountTarget"
                   outputClass:nil];
}

- (void)deleteMountTarget:(AWSelasticfilesystemDeleteMountTargetRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteMountTarget:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteTags:(AWSelasticfilesystemDeleteTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-02-01/delete-tags/{FileSystemId}"
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (void)deleteTags:(AWSelasticfilesystemDeleteTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemDescribeAccessPointsResponse *> *)describeAccessPoints:(AWSelasticfilesystemDescribeAccessPointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-02-01/access-points"
                  targetPrefix:@""
                 operationName:@"DescribeAccessPoints"
                   outputClass:[AWSelasticfilesystemDescribeAccessPointsResponse class]];
}

- (void)describeAccessPoints:(AWSelasticfilesystemDescribeAccessPointsRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemDescribeAccessPointsResponse *response, NSError *error))completionHandler {
    [[self describeAccessPoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemDescribeAccessPointsResponse *> * _Nonnull task) {
        AWSelasticfilesystemDescribeAccessPointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemFileSystemPolicyDescription *> *)describeFileSystemPolicy:(AWSelasticfilesystemDescribeFileSystemPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-02-01/file-systems/{FileSystemId}/policy"
                  targetPrefix:@""
                 operationName:@"DescribeFileSystemPolicy"
                   outputClass:[AWSelasticfilesystemFileSystemPolicyDescription class]];
}

- (void)describeFileSystemPolicy:(AWSelasticfilesystemDescribeFileSystemPolicyRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemFileSystemPolicyDescription *response, NSError *error))completionHandler {
    [[self describeFileSystemPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemFileSystemPolicyDescription *> * _Nonnull task) {
        AWSelasticfilesystemFileSystemPolicyDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemDescribeFileSystemsResponse *> *)describeFileSystems:(AWSelasticfilesystemDescribeFileSystemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-02-01/file-systems"
                  targetPrefix:@""
                 operationName:@"DescribeFileSystems"
                   outputClass:[AWSelasticfilesystemDescribeFileSystemsResponse class]];
}

- (void)describeFileSystems:(AWSelasticfilesystemDescribeFileSystemsRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemDescribeFileSystemsResponse *response, NSError *error))completionHandler {
    [[self describeFileSystems:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemDescribeFileSystemsResponse *> * _Nonnull task) {
        AWSelasticfilesystemDescribeFileSystemsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemLifecycleConfigurationDescription *> *)describeLifecycleConfiguration:(AWSelasticfilesystemDescribeLifecycleConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-02-01/file-systems/{FileSystemId}/lifecycle-configuration"
                  targetPrefix:@""
                 operationName:@"DescribeLifecycleConfiguration"
                   outputClass:[AWSelasticfilesystemLifecycleConfigurationDescription class]];
}

- (void)describeLifecycleConfiguration:(AWSelasticfilesystemDescribeLifecycleConfigurationRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemLifecycleConfigurationDescription *response, NSError *error))completionHandler {
    [[self describeLifecycleConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemLifecycleConfigurationDescription *> * _Nonnull task) {
        AWSelasticfilesystemLifecycleConfigurationDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemDescribeMountTargetSecurityGroupsResponse *> *)describeMountTargetSecurityGroups:(AWSelasticfilesystemDescribeMountTargetSecurityGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-02-01/mount-targets/{MountTargetId}/security-groups"
                  targetPrefix:@""
                 operationName:@"DescribeMountTargetSecurityGroups"
                   outputClass:[AWSelasticfilesystemDescribeMountTargetSecurityGroupsResponse class]];
}

- (void)describeMountTargetSecurityGroups:(AWSelasticfilesystemDescribeMountTargetSecurityGroupsRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemDescribeMountTargetSecurityGroupsResponse *response, NSError *error))completionHandler {
    [[self describeMountTargetSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemDescribeMountTargetSecurityGroupsResponse *> * _Nonnull task) {
        AWSelasticfilesystemDescribeMountTargetSecurityGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemDescribeMountTargetsResponse *> *)describeMountTargets:(AWSelasticfilesystemDescribeMountTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-02-01/mount-targets"
                  targetPrefix:@""
                 operationName:@"DescribeMountTargets"
                   outputClass:[AWSelasticfilesystemDescribeMountTargetsResponse class]];
}

- (void)describeMountTargets:(AWSelasticfilesystemDescribeMountTargetsRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemDescribeMountTargetsResponse *response, NSError *error))completionHandler {
    [[self describeMountTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemDescribeMountTargetsResponse *> * _Nonnull task) {
        AWSelasticfilesystemDescribeMountTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemDescribeTagsResponse *> *)describeTags:(AWSelasticfilesystemDescribeTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-02-01/tags/{FileSystemId}/"
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSelasticfilesystemDescribeTagsResponse class]];
}

- (void)describeTags:(AWSelasticfilesystemDescribeTagsRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemDescribeTagsResponse *response, NSError *error))completionHandler {
    [[self describeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemDescribeTagsResponse *> * _Nonnull task) {
        AWSelasticfilesystemDescribeTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemListTagsForResourceResponse *> *)listTagsForResource:(AWSelasticfilesystemListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-02-01/resource-tags/{ResourceId}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSelasticfilesystemListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSelasticfilesystemListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemListTagsForResourceResponse *> * _Nonnull task) {
        AWSelasticfilesystemListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyMountTargetSecurityGroups:(AWSelasticfilesystemModifyMountTargetSecurityGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-02-01/mount-targets/{MountTargetId}/security-groups"
                  targetPrefix:@""
                 operationName:@"ModifyMountTargetSecurityGroups"
                   outputClass:nil];
}

- (void)modifyMountTargetSecurityGroups:(AWSelasticfilesystemModifyMountTargetSecurityGroupsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyMountTargetSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemFileSystemPolicyDescription *> *)putFileSystemPolicy:(AWSelasticfilesystemPutFileSystemPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-02-01/file-systems/{FileSystemId}/policy"
                  targetPrefix:@""
                 operationName:@"PutFileSystemPolicy"
                   outputClass:[AWSelasticfilesystemFileSystemPolicyDescription class]];
}

- (void)putFileSystemPolicy:(AWSelasticfilesystemPutFileSystemPolicyRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemFileSystemPolicyDescription *response, NSError *error))completionHandler {
    [[self putFileSystemPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemFileSystemPolicyDescription *> * _Nonnull task) {
        AWSelasticfilesystemFileSystemPolicyDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemLifecycleConfigurationDescription *> *)putLifecycleConfiguration:(AWSelasticfilesystemPutLifecycleConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-02-01/file-systems/{FileSystemId}/lifecycle-configuration"
                  targetPrefix:@""
                 operationName:@"PutLifecycleConfiguration"
                   outputClass:[AWSelasticfilesystemLifecycleConfigurationDescription class]];
}

- (void)putLifecycleConfiguration:(AWSelasticfilesystemPutLifecycleConfigurationRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemLifecycleConfigurationDescription *response, NSError *error))completionHandler {
    [[self putLifecycleConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemLifecycleConfigurationDescription *> * _Nonnull task) {
        AWSelasticfilesystemLifecycleConfigurationDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSelasticfilesystemTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-02-01/resource-tags/{ResourceId}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSelasticfilesystemTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSelasticfilesystemUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-02-01/resource-tags/{ResourceId}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSelasticfilesystemUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSelasticfilesystemFileSystemDescription *> *)updateFileSystem:(AWSelasticfilesystemUpdateFileSystemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-02-01/file-systems/{FileSystemId}"
                  targetPrefix:@""
                 operationName:@"UpdateFileSystem"
                   outputClass:[AWSelasticfilesystemFileSystemDescription class]];
}

- (void)updateFileSystem:(AWSelasticfilesystemUpdateFileSystemRequest *)request
     completionHandler:(void (^)(AWSelasticfilesystemFileSystemDescription *response, NSError *error))completionHandler {
    [[self updateFileSystem:request] continueWithBlock:^id _Nullable(AWSTask<AWSelasticfilesystemFileSystemDescription *> * _Nonnull task) {
        AWSelasticfilesystemFileSystemDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
