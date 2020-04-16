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

#import "AWSsnowballService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSsnowballResources.h"

static NSString *const AWSInfosnowball = @"snowball";
NSString *const AWSsnowballSDKVersion = @"2.13.2";


@interface AWSsnowballResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSsnowballResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ClusterLimitExceededException" : @(AWSsnowballErrorClusterLimitExceeded),
                            @"Ec2RequestFailedException" : @(AWSsnowballErrorEc2RequestFailed),
                            @"InvalidAddressException" : @(AWSsnowballErrorInvalidAddress),
                            @"InvalidInputCombinationException" : @(AWSsnowballErrorInvalidInputCombination),
                            @"InvalidJobStateException" : @(AWSsnowballErrorInvalidJobState),
                            @"InvalidNextTokenException" : @(AWSsnowballErrorInvalidNextToken),
                            @"InvalidResourceException" : @(AWSsnowballErrorInvalidResource),
                            @"KMSRequestFailedException" : @(AWSsnowballErrorKMSRequestFailed),
                            @"UnsupportedAddressException" : @(AWSsnowballErrorUnsupportedAddress),
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
	                *error = [NSError errorWithDomain:AWSsnowballErrorDomain
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
        *error = [NSError errorWithDomain:AWSsnowballErrorDomain
                                     code:AWSsnowballErrorUnknown
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

@interface AWSsnowballRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSsnowballRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSsnowball()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSsnowball

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSsnowballSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSsnowball versions need to match. Check your SDK installation. AWSCore: %@ AWSsnowball: %@", AWSiOSSDKVersion, AWSsnowballSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultsnowball {
    static AWSsnowball *_defaultsnowball = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfosnowball];
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
        _defaultsnowball = [[AWSsnowball alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultsnowball;
}

+ (void)registersnowballWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSsnowball alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)snowballForKey:(NSString *)key {
    @synchronized(self) {
        AWSsnowball *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfosnowball
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSsnowball registersnowballWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removesnowballForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultsnowball` or `+ snowballForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicesnowball
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicesnowball];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSsnowballRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSsnowballResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSsnowballResponseSerializer alloc] initWithJSONDefinition:[[AWSsnowballResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSsnowballCancelClusterResult *> *)cancelCluster:(AWSsnowballCancelClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CancelCluster"
                   outputClass:[AWSsnowballCancelClusterResult class]];
}

- (void)cancelCluster:(AWSsnowballCancelClusterRequest *)request
     completionHandler:(void (^)(AWSsnowballCancelClusterResult *response, NSError *error))completionHandler {
    [[self cancelCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballCancelClusterResult *> * _Nonnull task) {
        AWSsnowballCancelClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballCancelJobResult *> *)cancelJob:(AWSsnowballCancelJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CancelJob"
                   outputClass:[AWSsnowballCancelJobResult class]];
}

- (void)cancelJob:(AWSsnowballCancelJobRequest *)request
     completionHandler:(void (^)(AWSsnowballCancelJobResult *response, NSError *error))completionHandler {
    [[self cancelJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballCancelJobResult *> * _Nonnull task) {
        AWSsnowballCancelJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballCreateAddressResult *> *)createAddress:(AWSsnowballCreateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CreateAddress"
                   outputClass:[AWSsnowballCreateAddressResult class]];
}

- (void)createAddress:(AWSsnowballCreateAddressRequest *)request
     completionHandler:(void (^)(AWSsnowballCreateAddressResult *response, NSError *error))completionHandler {
    [[self createAddress:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballCreateAddressResult *> * _Nonnull task) {
        AWSsnowballCreateAddressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballCreateClusterResult *> *)createCluster:(AWSsnowballCreateClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CreateCluster"
                   outputClass:[AWSsnowballCreateClusterResult class]];
}

- (void)createCluster:(AWSsnowballCreateClusterRequest *)request
     completionHandler:(void (^)(AWSsnowballCreateClusterResult *response, NSError *error))completionHandler {
    [[self createCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballCreateClusterResult *> * _Nonnull task) {
        AWSsnowballCreateClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballCreateJobResult *> *)createJob:(AWSsnowballCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CreateJob"
                   outputClass:[AWSsnowballCreateJobResult class]];
}

- (void)createJob:(AWSsnowballCreateJobRequest *)request
     completionHandler:(void (^)(AWSsnowballCreateJobResult *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballCreateJobResult *> * _Nonnull task) {
        AWSsnowballCreateJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballDescribeAddressResult *> *)describeAddress:(AWSsnowballDescribeAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"DescribeAddress"
                   outputClass:[AWSsnowballDescribeAddressResult class]];
}

- (void)describeAddress:(AWSsnowballDescribeAddressRequest *)request
     completionHandler:(void (^)(AWSsnowballDescribeAddressResult *response, NSError *error))completionHandler {
    [[self describeAddress:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballDescribeAddressResult *> * _Nonnull task) {
        AWSsnowballDescribeAddressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballDescribeAddressesResult *> *)describeAddresses:(AWSsnowballDescribeAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"DescribeAddresses"
                   outputClass:[AWSsnowballDescribeAddressesResult class]];
}

- (void)describeAddresses:(AWSsnowballDescribeAddressesRequest *)request
     completionHandler:(void (^)(AWSsnowballDescribeAddressesResult *response, NSError *error))completionHandler {
    [[self describeAddresses:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballDescribeAddressesResult *> * _Nonnull task) {
        AWSsnowballDescribeAddressesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballDescribeClusterResult *> *)describeCluster:(AWSsnowballDescribeClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"DescribeCluster"
                   outputClass:[AWSsnowballDescribeClusterResult class]];
}

- (void)describeCluster:(AWSsnowballDescribeClusterRequest *)request
     completionHandler:(void (^)(AWSsnowballDescribeClusterResult *response, NSError *error))completionHandler {
    [[self describeCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballDescribeClusterResult *> * _Nonnull task) {
        AWSsnowballDescribeClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballDescribeJobResult *> *)describeJob:(AWSsnowballDescribeJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"DescribeJob"
                   outputClass:[AWSsnowballDescribeJobResult class]];
}

- (void)describeJob:(AWSsnowballDescribeJobRequest *)request
     completionHandler:(void (^)(AWSsnowballDescribeJobResult *response, NSError *error))completionHandler {
    [[self describeJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballDescribeJobResult *> * _Nonnull task) {
        AWSsnowballDescribeJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballGetJobManifestResult *> *)getJobManifest:(AWSsnowballGetJobManifestRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"GetJobManifest"
                   outputClass:[AWSsnowballGetJobManifestResult class]];
}

- (void)getJobManifest:(AWSsnowballGetJobManifestRequest *)request
     completionHandler:(void (^)(AWSsnowballGetJobManifestResult *response, NSError *error))completionHandler {
    [[self getJobManifest:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballGetJobManifestResult *> * _Nonnull task) {
        AWSsnowballGetJobManifestResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballGetJobUnlockCodeResult *> *)getJobUnlockCode:(AWSsnowballGetJobUnlockCodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"GetJobUnlockCode"
                   outputClass:[AWSsnowballGetJobUnlockCodeResult class]];
}

- (void)getJobUnlockCode:(AWSsnowballGetJobUnlockCodeRequest *)request
     completionHandler:(void (^)(AWSsnowballGetJobUnlockCodeResult *response, NSError *error))completionHandler {
    [[self getJobUnlockCode:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballGetJobUnlockCodeResult *> * _Nonnull task) {
        AWSsnowballGetJobUnlockCodeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballGetSnowballUsageResult *> *)getSnowballUsage:(AWSsnowballGetSnowballUsageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"GetSnowballUsage"
                   outputClass:[AWSsnowballGetSnowballUsageResult class]];
}

- (void)getSnowballUsage:(AWSsnowballGetSnowballUsageRequest *)request
     completionHandler:(void (^)(AWSsnowballGetSnowballUsageResult *response, NSError *error))completionHandler {
    [[self getSnowballUsage:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballGetSnowballUsageResult *> * _Nonnull task) {
        AWSsnowballGetSnowballUsageResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballGetSoftwareUpdatesResult *> *)getSoftwareUpdates:(AWSsnowballGetSoftwareUpdatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"GetSoftwareUpdates"
                   outputClass:[AWSsnowballGetSoftwareUpdatesResult class]];
}

- (void)getSoftwareUpdates:(AWSsnowballGetSoftwareUpdatesRequest *)request
     completionHandler:(void (^)(AWSsnowballGetSoftwareUpdatesResult *response, NSError *error))completionHandler {
    [[self getSoftwareUpdates:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballGetSoftwareUpdatesResult *> * _Nonnull task) {
        AWSsnowballGetSoftwareUpdatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballListClusterJobsResult *> *)listClusterJobs:(AWSsnowballListClusterJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"ListClusterJobs"
                   outputClass:[AWSsnowballListClusterJobsResult class]];
}

- (void)listClusterJobs:(AWSsnowballListClusterJobsRequest *)request
     completionHandler:(void (^)(AWSsnowballListClusterJobsResult *response, NSError *error))completionHandler {
    [[self listClusterJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballListClusterJobsResult *> * _Nonnull task) {
        AWSsnowballListClusterJobsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballListClustersResult *> *)listClusters:(AWSsnowballListClustersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"ListClusters"
                   outputClass:[AWSsnowballListClustersResult class]];
}

- (void)listClusters:(AWSsnowballListClustersRequest *)request
     completionHandler:(void (^)(AWSsnowballListClustersResult *response, NSError *error))completionHandler {
    [[self listClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballListClustersResult *> * _Nonnull task) {
        AWSsnowballListClustersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballListCompatibleImagesResult *> *)listCompatibleImages:(AWSsnowballListCompatibleImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"ListCompatibleImages"
                   outputClass:[AWSsnowballListCompatibleImagesResult class]];
}

- (void)listCompatibleImages:(AWSsnowballListCompatibleImagesRequest *)request
     completionHandler:(void (^)(AWSsnowballListCompatibleImagesResult *response, NSError *error))completionHandler {
    [[self listCompatibleImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballListCompatibleImagesResult *> * _Nonnull task) {
        AWSsnowballListCompatibleImagesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballListJobsResult *> *)listJobs:(AWSsnowballListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"ListJobs"
                   outputClass:[AWSsnowballListJobsResult class]];
}

- (void)listJobs:(AWSsnowballListJobsRequest *)request
     completionHandler:(void (^)(AWSsnowballListJobsResult *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballListJobsResult *> * _Nonnull task) {
        AWSsnowballListJobsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballUpdateClusterResult *> *)updateCluster:(AWSsnowballUpdateClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"UpdateCluster"
                   outputClass:[AWSsnowballUpdateClusterResult class]];
}

- (void)updateCluster:(AWSsnowballUpdateClusterRequest *)request
     completionHandler:(void (^)(AWSsnowballUpdateClusterResult *response, NSError *error))completionHandler {
    [[self updateCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballUpdateClusterResult *> * _Nonnull task) {
        AWSsnowballUpdateClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsnowballUpdateJobResult *> *)updateJob:(AWSsnowballUpdateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"UpdateJob"
                   outputClass:[AWSsnowballUpdateJobResult class]];
}

- (void)updateJob:(AWSsnowballUpdateJobRequest *)request
     completionHandler:(void (^)(AWSsnowballUpdateJobResult *response, NSError *error))completionHandler {
    [[self updateJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSsnowballUpdateJobResult *> * _Nonnull task) {
        AWSsnowballUpdateJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
