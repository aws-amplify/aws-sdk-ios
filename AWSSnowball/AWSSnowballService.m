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

#import "AWSSnowballService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSnowballResources.h"

static NSString *const AWSInfoSnowball = @"Snowball";
NSString *const AWSSnowballSDKVersion = @"2.13.4";


@interface AWSSnowballResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSnowballResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ClusterLimitExceededException" : @(AWSSnowballErrorClusterLimitExceeded),
                            @"Ec2RequestFailedException" : @(AWSSnowballErrorEc2RequestFailed),
                            @"InvalidAddressException" : @(AWSSnowballErrorInvalidAddress),
                            @"InvalidInputCombinationException" : @(AWSSnowballErrorInvalidInputCombination),
                            @"InvalidJobStateException" : @(AWSSnowballErrorInvalidJobState),
                            @"InvalidNextTokenException" : @(AWSSnowballErrorInvalidNextToken),
                            @"InvalidResourceException" : @(AWSSnowballErrorInvalidResource),
                            @"KMSRequestFailedException" : @(AWSSnowballErrorKMSRequestFailed),
                            @"UnsupportedAddressException" : @(AWSSnowballErrorUnsupportedAddress),
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
	                *error = [NSError errorWithDomain:AWSSnowballErrorDomain
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
        *error = [NSError errorWithDomain:AWSSnowballErrorDomain
                                     code:AWSSnowballErrorUnknown
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

@interface AWSSnowballRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSnowballRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSnowball()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSnowball

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSnowballSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSnowball versions need to match. Check your SDK installation. AWSCore: %@ AWSSnowball: %@", AWSiOSSDKVersion, AWSSnowballSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSnowball {
    static AWSSnowball *_defaultSnowball = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSnowball];
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
        _defaultSnowball = [[AWSSnowball alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSnowball;
}

+ (void)registerSnowballWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSnowball alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SnowballForKey:(NSString *)key {
    @synchronized(self) {
        AWSSnowball *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSnowball
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSnowball registerSnowballWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSnowballForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSnowball` or `+ SnowballForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSnowball
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSnowball];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSnowballRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSnowballResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSnowballResponseSerializer alloc] initWithJSONDefinition:[[AWSSnowballResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSnowballCancelClusterResult *> *)cancelCluster:(AWSSnowballCancelClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CancelCluster"
                   outputClass:[AWSSnowballCancelClusterResult class]];
}

- (void)cancelCluster:(AWSSnowballCancelClusterRequest *)request
     completionHandler:(void (^)(AWSSnowballCancelClusterResult *response, NSError *error))completionHandler {
    [[self cancelCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballCancelClusterResult *> * _Nonnull task) {
        AWSSnowballCancelClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballCancelJobResult *> *)cancelJob:(AWSSnowballCancelJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CancelJob"
                   outputClass:[AWSSnowballCancelJobResult class]];
}

- (void)cancelJob:(AWSSnowballCancelJobRequest *)request
     completionHandler:(void (^)(AWSSnowballCancelJobResult *response, NSError *error))completionHandler {
    [[self cancelJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballCancelJobResult *> * _Nonnull task) {
        AWSSnowballCancelJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballCreateAddressResult *> *)createAddress:(AWSSnowballCreateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CreateAddress"
                   outputClass:[AWSSnowballCreateAddressResult class]];
}

- (void)createAddress:(AWSSnowballCreateAddressRequest *)request
     completionHandler:(void (^)(AWSSnowballCreateAddressResult *response, NSError *error))completionHandler {
    [[self createAddress:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballCreateAddressResult *> * _Nonnull task) {
        AWSSnowballCreateAddressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballCreateClusterResult *> *)createCluster:(AWSSnowballCreateClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CreateCluster"
                   outputClass:[AWSSnowballCreateClusterResult class]];
}

- (void)createCluster:(AWSSnowballCreateClusterRequest *)request
     completionHandler:(void (^)(AWSSnowballCreateClusterResult *response, NSError *error))completionHandler {
    [[self createCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballCreateClusterResult *> * _Nonnull task) {
        AWSSnowballCreateClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballCreateJobResult *> *)createJob:(AWSSnowballCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"CreateJob"
                   outputClass:[AWSSnowballCreateJobResult class]];
}

- (void)createJob:(AWSSnowballCreateJobRequest *)request
     completionHandler:(void (^)(AWSSnowballCreateJobResult *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballCreateJobResult *> * _Nonnull task) {
        AWSSnowballCreateJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballDescribeAddressResult *> *)describeAddress:(AWSSnowballDescribeAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"DescribeAddress"
                   outputClass:[AWSSnowballDescribeAddressResult class]];
}

- (void)describeAddress:(AWSSnowballDescribeAddressRequest *)request
     completionHandler:(void (^)(AWSSnowballDescribeAddressResult *response, NSError *error))completionHandler {
    [[self describeAddress:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballDescribeAddressResult *> * _Nonnull task) {
        AWSSnowballDescribeAddressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballDescribeAddressesResult *> *)describeAddresses:(AWSSnowballDescribeAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"DescribeAddresses"
                   outputClass:[AWSSnowballDescribeAddressesResult class]];
}

- (void)describeAddresses:(AWSSnowballDescribeAddressesRequest *)request
     completionHandler:(void (^)(AWSSnowballDescribeAddressesResult *response, NSError *error))completionHandler {
    [[self describeAddresses:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballDescribeAddressesResult *> * _Nonnull task) {
        AWSSnowballDescribeAddressesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballDescribeClusterResult *> *)describeCluster:(AWSSnowballDescribeClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"DescribeCluster"
                   outputClass:[AWSSnowballDescribeClusterResult class]];
}

- (void)describeCluster:(AWSSnowballDescribeClusterRequest *)request
     completionHandler:(void (^)(AWSSnowballDescribeClusterResult *response, NSError *error))completionHandler {
    [[self describeCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballDescribeClusterResult *> * _Nonnull task) {
        AWSSnowballDescribeClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballDescribeJobResult *> *)describeJob:(AWSSnowballDescribeJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"DescribeJob"
                   outputClass:[AWSSnowballDescribeJobResult class]];
}

- (void)describeJob:(AWSSnowballDescribeJobRequest *)request
     completionHandler:(void (^)(AWSSnowballDescribeJobResult *response, NSError *error))completionHandler {
    [[self describeJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballDescribeJobResult *> * _Nonnull task) {
        AWSSnowballDescribeJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballGetJobManifestResult *> *)getJobManifest:(AWSSnowballGetJobManifestRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"GetJobManifest"
                   outputClass:[AWSSnowballGetJobManifestResult class]];
}

- (void)getJobManifest:(AWSSnowballGetJobManifestRequest *)request
     completionHandler:(void (^)(AWSSnowballGetJobManifestResult *response, NSError *error))completionHandler {
    [[self getJobManifest:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballGetJobManifestResult *> * _Nonnull task) {
        AWSSnowballGetJobManifestResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballGetJobUnlockCodeResult *> *)getJobUnlockCode:(AWSSnowballGetJobUnlockCodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"GetJobUnlockCode"
                   outputClass:[AWSSnowballGetJobUnlockCodeResult class]];
}

- (void)getJobUnlockCode:(AWSSnowballGetJobUnlockCodeRequest *)request
     completionHandler:(void (^)(AWSSnowballGetJobUnlockCodeResult *response, NSError *error))completionHandler {
    [[self getJobUnlockCode:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballGetJobUnlockCodeResult *> * _Nonnull task) {
        AWSSnowballGetJobUnlockCodeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballGetSnowballUsageResult *> *)getSnowballUsage:(AWSSnowballGetSnowballUsageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"GetSnowballUsage"
                   outputClass:[AWSSnowballGetSnowballUsageResult class]];
}

- (void)getSnowballUsage:(AWSSnowballGetSnowballUsageRequest *)request
     completionHandler:(void (^)(AWSSnowballGetSnowballUsageResult *response, NSError *error))completionHandler {
    [[self getSnowballUsage:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballGetSnowballUsageResult *> * _Nonnull task) {
        AWSSnowballGetSnowballUsageResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballGetSoftwareUpdatesResult *> *)getSoftwareUpdates:(AWSSnowballGetSoftwareUpdatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"GetSoftwareUpdates"
                   outputClass:[AWSSnowballGetSoftwareUpdatesResult class]];
}

- (void)getSoftwareUpdates:(AWSSnowballGetSoftwareUpdatesRequest *)request
     completionHandler:(void (^)(AWSSnowballGetSoftwareUpdatesResult *response, NSError *error))completionHandler {
    [[self getSoftwareUpdates:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballGetSoftwareUpdatesResult *> * _Nonnull task) {
        AWSSnowballGetSoftwareUpdatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballListClusterJobsResult *> *)listClusterJobs:(AWSSnowballListClusterJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"ListClusterJobs"
                   outputClass:[AWSSnowballListClusterJobsResult class]];
}

- (void)listClusterJobs:(AWSSnowballListClusterJobsRequest *)request
     completionHandler:(void (^)(AWSSnowballListClusterJobsResult *response, NSError *error))completionHandler {
    [[self listClusterJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballListClusterJobsResult *> * _Nonnull task) {
        AWSSnowballListClusterJobsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballListClustersResult *> *)listClusters:(AWSSnowballListClustersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"ListClusters"
                   outputClass:[AWSSnowballListClustersResult class]];
}

- (void)listClusters:(AWSSnowballListClustersRequest *)request
     completionHandler:(void (^)(AWSSnowballListClustersResult *response, NSError *error))completionHandler {
    [[self listClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballListClustersResult *> * _Nonnull task) {
        AWSSnowballListClustersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballListCompatibleImagesResult *> *)listCompatibleImages:(AWSSnowballListCompatibleImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"ListCompatibleImages"
                   outputClass:[AWSSnowballListCompatibleImagesResult class]];
}

- (void)listCompatibleImages:(AWSSnowballListCompatibleImagesRequest *)request
     completionHandler:(void (^)(AWSSnowballListCompatibleImagesResult *response, NSError *error))completionHandler {
    [[self listCompatibleImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballListCompatibleImagesResult *> * _Nonnull task) {
        AWSSnowballListCompatibleImagesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballListJobsResult *> *)listJobs:(AWSSnowballListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"ListJobs"
                   outputClass:[AWSSnowballListJobsResult class]];
}

- (void)listJobs:(AWSSnowballListJobsRequest *)request
     completionHandler:(void (^)(AWSSnowballListJobsResult *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballListJobsResult *> * _Nonnull task) {
        AWSSnowballListJobsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballUpdateClusterResult *> *)updateCluster:(AWSSnowballUpdateClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"UpdateCluster"
                   outputClass:[AWSSnowballUpdateClusterResult class]];
}

- (void)updateCluster:(AWSSnowballUpdateClusterRequest *)request
     completionHandler:(void (^)(AWSSnowballUpdateClusterResult *response, NSError *error))completionHandler {
    [[self updateCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballUpdateClusterResult *> * _Nonnull task) {
        AWSSnowballUpdateClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSnowballUpdateJobResult *> *)updateJob:(AWSSnowballUpdateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSIESnowballJobManagementService"
                 operationName:@"UpdateJob"
                   outputClass:[AWSSnowballUpdateJobResult class]];
}

- (void)updateJob:(AWSSnowballUpdateJobRequest *)request
     completionHandler:(void (^)(AWSSnowballUpdateJobResult *response, NSError *error))completionHandler {
    [[self updateJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSnowballUpdateJobResult *> * _Nonnull task) {
        AWSSnowballUpdateJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
