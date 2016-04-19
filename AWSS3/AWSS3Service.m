//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSS3.h"

#import "AWSNetworking.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSCategory.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSS3Resources.h"

static NSString *const AWSInfoS3 = @"S3";

@interface AWSS3ResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSS3ResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BucketAlreadyExists" : @(AWSS3ErrorBucketAlreadyExists),
                            @"BucketAlreadyOwnedByYou" : @(AWSS3ErrorBucketAlreadyOwnedByYou),
                            @"NoSuchBucket" : @(AWSS3ErrorNoSuchBucket),
                            @"NoSuchKey" : @(AWSS3ErrorNoSuchKey),
                            @"NoSuchUpload" : @(AWSS3ErrorNoSuchUpload),
                            @"ObjectAlreadyInActiveTierError" : @(AWSS3ErrorObjectAlreadyInActiveTier),
                            @"ObjectNotInActiveTierError" : @(AWSS3ErrorObjectNotInActiveTier),
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
                *error = [NSError errorWithDomain:AWSS3ErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSS3ErrorDomain
                                             code:AWSS3ErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error
        && response.statusCode/100 != 2
        && response.statusCode/100 != 3) {
        *error = [NSError errorWithDomain:AWSS3ErrorDomain
                                     code:AWSS3ErrorUnknown
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

@interface AWSS3RequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSS3RequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && currentRetryCount < self.maxRetryCount) {
        if (response.statusCode == 200
            && error
            && error.code != NSURLErrorCancelled) {
            retryType = AWSNetworkingRetryTypeShouldRetry;
        }
    }

    if (currentRetryCount < self.maxRetryCount
        && [error.domain isEqualToString:AWSServiceErrorDomain]) {
        switch (error.code) {
            case AWSServiceErrorSignatureDoesNotMatch:
                //may happened right after generating AWS temporary credentials due to the massively distributed nature of Amazon S3, just retry the request
                retryType = AWSNetworkingRetryTypeShouldRetry;
                break;

            default:
                break;
        }
    }

    return retryType;
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSS3()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSS3

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultS3 {
    static AWSS3 *_defaultS3 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoS3];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }

        _defaultS3 = [[AWSS3 alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultS3;
}

+ (void)registerS3WithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSS3 alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)S3ForKey:(NSString *)key {
    @synchronized(self) {
        AWSS3 *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoS3
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSS3 registerS3WithConfiguration:serviceConfiguration
                                        forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeS3ForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultS3` or `+ S3ForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceS3
                                                         useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSS3RequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];

        _networking = [[AWSNetworking alloc] initWithConfiguration:_configuration];
    }

    return self;
}

-(NSString *)urlStringWithBucketName:(NSString *)bucketName objectName:(NSString *)objectName subResource:(NSString *)subResource {
    if (!bucketName) return nil;
    NSString *keyPath;
    NSString *resQuery;

    keyPath  = (objectName == nil ? [NSString stringWithFormat:@"%@", bucketName] : [NSString stringWithFormat:@"%@/%@", bucketName, [objectName aws_stringWithURLEncoding]]);
    resQuery = (subResource == nil ? @"" : [NSString stringWithFormat:@"?%@", subResource]);

    return [NSString stringWithFormat:@"%@/%@%@", self.configuration.endpoint.URL, keyPath, resQuery];
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
        networkingRequest.shouldWriteDirectly = [[request valueForKey:@"shouldWriteDirectly"] boolValue];
        networkingRequest.downloadingFileURL = request.downloadingFileURL;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSXMLRequestSerializer alloc] initWithJSONDefinition:[[AWSS3Resources sharedInstance] JSONObject]
                                                                                           actionName:operationName];
        networkingRequest.responseSerializer = [[AWSS3ResponseSerializer alloc] initWithJSONDefinition:[[AWSS3Resources sharedInstance] JSONObject]
                                                                                            actionName:operationName
                                                                                           outputClass:outputClass];
        return [[self.networking sendRequest:networkingRequest] continueWithBlock:^id(AWSTask *task) {
            request.internalRequest = nil;
            return task;
        }];
    }
}

#pragma mark - Service method

- (AWSTask<AWSS3AbortMultipartUploadOutput *> *)abortMultipartUpload:(AWSS3AbortMultipartUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"AbortMultipartUpload"
                   outputClass:[AWSS3AbortMultipartUploadOutput class]];
}

- (void)abortMultipartUpload:(AWSS3AbortMultipartUploadRequest *)request
           completionHandler:(void (^)(AWSS3AbortMultipartUploadOutput *response, NSError *error))completionHandler {
    [[self abortMultipartUpload:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3AbortMultipartUploadOutput *> * _Nonnull task) {
        AWSS3AbortMultipartUploadOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3CompleteMultipartUploadOutput *> *)completeMultipartUpload:(AWSS3CompleteMultipartUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"CompleteMultipartUpload"
                   outputClass:[AWSS3CompleteMultipartUploadOutput class]];
}

- (void)completeMultipartUpload:(AWSS3CompleteMultipartUploadRequest *)request
              completionHandler:(void (^)(AWSS3CompleteMultipartUploadOutput *response, NSError *error))completionHandler {
    [[self completeMultipartUpload:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3CompleteMultipartUploadOutput *> * _Nonnull task) {
        AWSS3CompleteMultipartUploadOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3CreateBucketOutput *> *)createBucket:(AWSS3CreateBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"CreateBucket"
                   outputClass:[AWSS3CreateBucketOutput class]];
}

- (void)createBucket:(AWSS3CreateBucketRequest *)request
   completionHandler:(void (^)(AWSS3CreateBucketOutput *response, NSError *error))completionHandler {
    [[self createBucket:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3CreateBucketOutput *> * _Nonnull task) {
        AWSS3CreateBucketOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3CreateMultipartUploadOutput *> *)createMultipartUpload:(AWSS3CreateMultipartUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}/{Key+}?uploads"
                  targetPrefix:@""
                 operationName:@"CreateMultipartUpload"
                   outputClass:[AWSS3CreateMultipartUploadOutput class]];
}

- (void)createMultipartUpload:(AWSS3CreateMultipartUploadRequest *)request
            completionHandler:(void (^)(AWSS3CreateMultipartUploadOutput *response, NSError *error))completionHandler {
    [[self createMultipartUpload:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3CreateMultipartUploadOutput *> * _Nonnull task) {
        AWSS3CreateMultipartUploadOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBucket:(AWSS3DeleteBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"DeleteBucket"
                   outputClass:nil];
}

- (void)deleteBucket:(AWSS3DeleteBucketRequest *)request
   completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBucket:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBucketCors:(AWSS3DeleteBucketCorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?cors"
                  targetPrefix:@""
                 operationName:@"DeleteBucketCors"
                   outputClass:nil];
}

- (void)deleteBucketCors:(AWSS3DeleteBucketCorsRequest *)request
       completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBucketCors:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBucketLifecycle:(AWSS3DeleteBucketLifecycleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"DeleteBucketLifecycle"
                   outputClass:nil];
}

- (void)deleteBucketLifecycle:(AWSS3DeleteBucketLifecycleRequest *)request
            completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBucketLifecycle:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBucketPolicy:(AWSS3DeleteBucketPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?policy"
                  targetPrefix:@""
                 operationName:@"DeleteBucketPolicy"
                   outputClass:nil];
}

- (void)deleteBucketPolicy:(AWSS3DeleteBucketPolicyRequest *)request
         completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBucketPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBucketReplication:(AWSS3DeleteBucketReplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?replication"
                  targetPrefix:@""
                 operationName:@"DeleteBucketReplication"
                   outputClass:nil];
}

- (void)deleteBucketReplication:(AWSS3DeleteBucketReplicationRequest *)request
              completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBucketReplication:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBucketTagging:(AWSS3DeleteBucketTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?tagging"
                  targetPrefix:@""
                 operationName:@"DeleteBucketTagging"
                   outputClass:nil];
}

- (void)deleteBucketTagging:(AWSS3DeleteBucketTaggingRequest *)request
          completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBucketTagging:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBucketWebsite:(AWSS3DeleteBucketWebsiteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?website"
                  targetPrefix:@""
                 operationName:@"DeleteBucketWebsite"
                   outputClass:nil];
}

- (void)deleteBucketWebsite:(AWSS3DeleteBucketWebsiteRequest *)request
          completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBucketWebsite:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3DeleteObjectOutput *> *)deleteObject:(AWSS3DeleteObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"DeleteObject"
                   outputClass:[AWSS3DeleteObjectOutput class]];
}

- (void)deleteObject:(AWSS3DeleteObjectRequest *)request
   completionHandler:(void (^)(AWSS3DeleteObjectOutput *response, NSError *error))completionHandler {
    [[self deleteObject:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3DeleteObjectOutput *> * _Nonnull task) {
        AWSS3DeleteObjectOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3DeleteObjectsOutput *> *)deleteObjects:(AWSS3DeleteObjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}?delete"
                  targetPrefix:@""
                 operationName:@"DeleteObjects"
                   outputClass:[AWSS3DeleteObjectsOutput class]];
}

- (void)deleteObjects:(AWSS3DeleteObjectsRequest *)request
    completionHandler:(void (^)(AWSS3DeleteObjectsOutput *response, NSError *error))completionHandler {
    [[self deleteObjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3DeleteObjectsOutput *> * _Nonnull task) {
        AWSS3DeleteObjectsOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketAclOutput *> *)getBucketAcl:(AWSS3GetBucketAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?acl"
                  targetPrefix:@""
                 operationName:@"GetBucketAcl"
                   outputClass:[AWSS3GetBucketAclOutput class]];
}

- (void)getBucketAcl:(AWSS3GetBucketAclRequest *)request
   completionHandler:(void (^)(AWSS3GetBucketAclOutput *response, NSError *error))completionHandler {
    [[self getBucketAcl:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketAclOutput *> * _Nonnull task) {
        AWSS3GetBucketAclOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketCorsOutput *> *)getBucketCors:(AWSS3GetBucketCorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?cors"
                  targetPrefix:@""
                 operationName:@"GetBucketCors"
                   outputClass:[AWSS3GetBucketCorsOutput class]];
}

- (void)getBucketCors:(AWSS3GetBucketCorsRequest *)request
    completionHandler:(void (^)(AWSS3GetBucketCorsOutput *response, NSError *error))completionHandler {
    [[self getBucketCors:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketCorsOutput *> * _Nonnull task) {
        AWSS3GetBucketCorsOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketLifecycleOutput *> *)getBucketLifecycle:(AWSS3GetBucketLifecycleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"GetBucketLifecycle"
                   outputClass:[AWSS3GetBucketLifecycleOutput class]];
}

- (void)getBucketLifecycle:(AWSS3GetBucketLifecycleRequest *)request
         completionHandler:(void (^)(AWSS3GetBucketLifecycleOutput *response, NSError *error))completionHandler {
    [[self getBucketLifecycle:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketLifecycleOutput *> * _Nonnull task) {
        AWSS3GetBucketLifecycleOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketLifecycleConfigurationOutput *> *)getBucketLifecycleConfiguration:(AWSS3GetBucketLifecycleConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"GetBucketLifecycleConfiguration"
                   outputClass:[AWSS3GetBucketLifecycleConfigurationOutput class]];
}

- (void)getBucketLifecycleConfiguration:(AWSS3GetBucketLifecycleConfigurationRequest *)request
                      completionHandler:(void (^)(AWSS3GetBucketLifecycleConfigurationOutput *response, NSError *error))completionHandler {
    [[self getBucketLifecycleConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketLifecycleConfigurationOutput *> * _Nonnull task) {
        AWSS3GetBucketLifecycleConfigurationOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketLocationOutput *> *)getBucketLocation:(AWSS3GetBucketLocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?location"
                  targetPrefix:@""
                 operationName:@"GetBucketLocation"
                   outputClass:[AWSS3GetBucketLocationOutput class]];
}

- (void)getBucketLocation:(AWSS3GetBucketLocationRequest *)request
        completionHandler:(void (^)(AWSS3GetBucketLocationOutput *response, NSError *error))completionHandler {
    [[self getBucketLocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketLocationOutput *> * _Nonnull task) {
        AWSS3GetBucketLocationOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketLoggingOutput *> *)getBucketLogging:(AWSS3GetBucketLoggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?logging"
                  targetPrefix:@""
                 operationName:@"GetBucketLogging"
                   outputClass:[AWSS3GetBucketLoggingOutput class]];
}

- (void)getBucketLogging:(AWSS3GetBucketLoggingRequest *)request
       completionHandler:(void (^)(AWSS3GetBucketLoggingOutput *response, NSError *error))completionHandler {
    [[self getBucketLogging:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketLoggingOutput *> * _Nonnull task) {
        AWSS3GetBucketLoggingOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3NotificationConfigurationDeprecated *> *)getBucketNotification:(AWSS3GetBucketNotificationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?notification"
                  targetPrefix:@""
                 operationName:@"GetBucketNotification"
                   outputClass:[AWSS3NotificationConfigurationDeprecated class]];
}

- (void)getBucketNotification:(AWSS3GetBucketNotificationConfigurationRequest *)request
            completionHandler:(void (^)(AWSS3NotificationConfigurationDeprecated *response, NSError *error))completionHandler {
    [[self getBucketNotification:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3NotificationConfigurationDeprecated *> * _Nonnull task) {
        AWSS3NotificationConfigurationDeprecated *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3NotificationConfiguration *> *)getBucketNotificationConfiguration:(AWSS3GetBucketNotificationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?notification"
                  targetPrefix:@""
                 operationName:@"GetBucketNotificationConfiguration"
                   outputClass:[AWSS3NotificationConfiguration class]];
}

- (void)getBucketNotificationConfiguration:(AWSS3GetBucketNotificationConfigurationRequest *)request
                         completionHandler:(void (^)(AWSS3NotificationConfiguration *response, NSError *error))completionHandler {
    [[self getBucketNotificationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3NotificationConfiguration *> * _Nonnull task) {
        AWSS3NotificationConfiguration *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketPolicyOutput *> *)getBucketPolicy:(AWSS3GetBucketPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?policy"
                  targetPrefix:@""
                 operationName:@"GetBucketPolicy"
                   outputClass:[AWSS3GetBucketPolicyOutput class]];
}

- (void)getBucketPolicy:(AWSS3GetBucketPolicyRequest *)request
      completionHandler:(void (^)(AWSS3GetBucketPolicyOutput *response, NSError *error))completionHandler {
    [[self getBucketPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketPolicyOutput *> * _Nonnull task) {
        AWSS3GetBucketPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketReplicationOutput *> *)getBucketReplication:(AWSS3GetBucketReplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?replication"
                  targetPrefix:@""
                 operationName:@"GetBucketReplication"
                   outputClass:[AWSS3GetBucketReplicationOutput class]];
}

- (void)getBucketReplication:(AWSS3GetBucketReplicationRequest *)request
           completionHandler:(void (^)(AWSS3GetBucketReplicationOutput *response, NSError *error))completionHandler {
    [[self getBucketReplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketReplicationOutput *> * _Nonnull task) {
        AWSS3GetBucketReplicationOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketRequestPaymentOutput *> *)getBucketRequestPayment:(AWSS3GetBucketRequestPaymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?requestPayment"
                  targetPrefix:@""
                 operationName:@"GetBucketRequestPayment"
                   outputClass:[AWSS3GetBucketRequestPaymentOutput class]];
}

- (void)getBucketRequestPayment:(AWSS3GetBucketRequestPaymentRequest *)request
              completionHandler:(void (^)(AWSS3GetBucketRequestPaymentOutput *response, NSError *error))completionHandler {
    [[self getBucketRequestPayment:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketRequestPaymentOutput *> * _Nonnull task) {
        AWSS3GetBucketRequestPaymentOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketTaggingOutput *> *)getBucketTagging:(AWSS3GetBucketTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?tagging"
                  targetPrefix:@""
                 operationName:@"GetBucketTagging"
                   outputClass:[AWSS3GetBucketTaggingOutput class]];
}

- (void)getBucketTagging:(AWSS3GetBucketTaggingRequest *)request
       completionHandler:(void (^)(AWSS3GetBucketTaggingOutput *response, NSError *error))completionHandler {
    [[self getBucketTagging:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketTaggingOutput *> * _Nonnull task) {
        AWSS3GetBucketTaggingOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketVersioningOutput *> *)getBucketVersioning:(AWSS3GetBucketVersioningRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?versioning"
                  targetPrefix:@""
                 operationName:@"GetBucketVersioning"
                   outputClass:[AWSS3GetBucketVersioningOutput class]];
}

- (void)getBucketVersioning:(AWSS3GetBucketVersioningRequest *)request
          completionHandler:(void (^)(AWSS3GetBucketVersioningOutput *response, NSError *error))completionHandler {
    [[self getBucketVersioning:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketVersioningOutput *> * _Nonnull task) {
        AWSS3GetBucketVersioningOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetBucketWebsiteOutput *> *)getBucketWebsite:(AWSS3GetBucketWebsiteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?website"
                  targetPrefix:@""
                 operationName:@"GetBucketWebsite"
                   outputClass:[AWSS3GetBucketWebsiteOutput class]];
}

- (void)getBucketWebsite:(AWSS3GetBucketWebsiteRequest *)request
       completionHandler:(void (^)(AWSS3GetBucketWebsiteOutput *response, NSError *error))completionHandler {
    [[self getBucketWebsite:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetBucketWebsiteOutput *> * _Nonnull task) {
        AWSS3GetBucketWebsiteOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetObjectOutput *> *)getObject:(AWSS3GetObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"GetObject"
                   outputClass:[AWSS3GetObjectOutput class]];
}

- (void)getObject:(AWSS3GetObjectRequest *)request
completionHandler:(void (^)(AWSS3GetObjectOutput *response, NSError *error))completionHandler {
    [[self getObject:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetObjectOutput *> * _Nonnull task) {
        AWSS3GetObjectOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetObjectAclOutput *> *)getObjectAcl:(AWSS3GetObjectAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}?acl"
                  targetPrefix:@""
                 operationName:@"GetObjectAcl"
                   outputClass:[AWSS3GetObjectAclOutput class]];
}

- (void)getObjectAcl:(AWSS3GetObjectAclRequest *)request
   completionHandler:(void (^)(AWSS3GetObjectAclOutput *response, NSError *error))completionHandler {
    [[self getObjectAcl:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetObjectAclOutput *> * _Nonnull task) {
        AWSS3GetObjectAclOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3GetObjectTorrentOutput *> *)getObjectTorrent:(AWSS3GetObjectTorrentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}?torrent"
                  targetPrefix:@""
                 operationName:@"GetObjectTorrent"
                   outputClass:[AWSS3GetObjectTorrentOutput class]];
}

- (void)getObjectTorrent:(AWSS3GetObjectTorrentRequest *)request
       completionHandler:(void (^)(AWSS3GetObjectTorrentOutput *response, NSError *error))completionHandler {
    [[self getObjectTorrent:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3GetObjectTorrentOutput *> * _Nonnull task) {
        AWSS3GetObjectTorrentOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)headBucket:(AWSS3HeadBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodHEAD
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"HeadBucket"
                   outputClass:nil];
}

- (void)headBucket:(AWSS3HeadBucketRequest *)request
 completionHandler:(void (^)(NSError *error))completionHandler {
    [[self headBucket:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3HeadObjectOutput *> *)headObject:(AWSS3HeadObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodHEAD
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"HeadObject"
                   outputClass:[AWSS3HeadObjectOutput class]];
}

- (void)headObject:(AWSS3HeadObjectRequest *)request
 completionHandler:(void (^)(AWSS3HeadObjectOutput *response, NSError *error))completionHandler {
    [[self headObject:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3HeadObjectOutput *> * _Nonnull task) {
        AWSS3HeadObjectOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3ListBucketsOutput *> *)listBuckets:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListBuckets"
                   outputClass:[AWSS3ListBucketsOutput class]];
}

- (void)listBuckets:(AWSRequest *)request
  completionHandler:(void (^)(AWSS3ListBucketsOutput *response, NSError *error))completionHandler {
    [[self listBuckets:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3ListBucketsOutput *> * _Nonnull task) {
        AWSS3ListBucketsOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3ListMultipartUploadsOutput *> *)listMultipartUploads:(AWSS3ListMultipartUploadsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?uploads"
                  targetPrefix:@""
                 operationName:@"ListMultipartUploads"
                   outputClass:[AWSS3ListMultipartUploadsOutput class]];
}

- (void)listMultipartUploads:(AWSS3ListMultipartUploadsRequest *)request
           completionHandler:(void (^)(AWSS3ListMultipartUploadsOutput *response, NSError *error))completionHandler {
    [[self listMultipartUploads:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3ListMultipartUploadsOutput *> * _Nonnull task) {
        AWSS3ListMultipartUploadsOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3ListObjectVersionsOutput *> *)listObjectVersions:(AWSS3ListObjectVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?versions"
                  targetPrefix:@""
                 operationName:@"ListObjectVersions"
                   outputClass:[AWSS3ListObjectVersionsOutput class]];
}

- (void)listObjectVersions:(AWSS3ListObjectVersionsRequest *)request
         completionHandler:(void (^)(AWSS3ListObjectVersionsOutput *response, NSError *error))completionHandler {
    [[self listObjectVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3ListObjectVersionsOutput *> * _Nonnull task) {
        AWSS3ListObjectVersionsOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3ListObjectsOutput *> *)listObjects:(AWSS3ListObjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"ListObjects"
                   outputClass:[AWSS3ListObjectsOutput class]];
}

- (void)listObjects:(AWSS3ListObjectsRequest *)request
  completionHandler:(void (^)(AWSS3ListObjectsOutput *response, NSError *error))completionHandler {
    [[self listObjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3ListObjectsOutput *> * _Nonnull task) {
        AWSS3ListObjectsOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3ListPartsOutput *> *)listParts:(AWSS3ListPartsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"ListParts"
                   outputClass:[AWSS3ListPartsOutput class]];
}

- (void)listParts:(AWSS3ListPartsRequest *)request
completionHandler:(void (^)(AWSS3ListPartsOutput *response, NSError *error))completionHandler {
    [[self listParts:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3ListPartsOutput *> * _Nonnull task) {
        AWSS3ListPartsOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketAcl:(AWSS3PutBucketAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?acl"
                  targetPrefix:@""
                 operationName:@"PutBucketAcl"
                   outputClass:nil];
}

- (void)putBucketAcl:(AWSS3PutBucketAclRequest *)request
   completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketAcl:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketCors:(AWSS3PutBucketCorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?cors"
                  targetPrefix:@""
                 operationName:@"PutBucketCors"
                   outputClass:nil];
}

- (void)putBucketCors:(AWSS3PutBucketCorsRequest *)request
    completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketCors:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketLifecycle:(AWSS3PutBucketLifecycleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"PutBucketLifecycle"
                   outputClass:nil];
}

- (void)putBucketLifecycle:(AWSS3PutBucketLifecycleRequest *)request
         completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketLifecycle:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketLifecycleConfiguration:(AWSS3PutBucketLifecycleConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"PutBucketLifecycleConfiguration"
                   outputClass:nil];
}

- (void)putBucketLifecycleConfiguration:(AWSS3PutBucketLifecycleConfigurationRequest *)request
                      completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketLifecycleConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketLogging:(AWSS3PutBucketLoggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?logging"
                  targetPrefix:@""
                 operationName:@"PutBucketLogging"
                   outputClass:nil];
}

- (void)putBucketLogging:(AWSS3PutBucketLoggingRequest *)request
       completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketLogging:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketNotification:(AWSS3PutBucketNotificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?notification"
                  targetPrefix:@""
                 operationName:@"PutBucketNotification"
                   outputClass:nil];
}

- (void)putBucketNotification:(AWSS3PutBucketNotificationRequest *)request
            completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketNotification:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketNotificationConfiguration:(AWSS3PutBucketNotificationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?notification"
                  targetPrefix:@""
                 operationName:@"PutBucketNotificationConfiguration"
                   outputClass:nil];
}

- (void)putBucketNotificationConfiguration:(AWSS3PutBucketNotificationConfigurationRequest *)request
                         completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketNotificationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketPolicy:(AWSS3PutBucketPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?policy"
                  targetPrefix:@""
                 operationName:@"PutBucketPolicy"
                   outputClass:nil];
}

- (void)putBucketPolicy:(AWSS3PutBucketPolicyRequest *)request
      completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketReplication:(AWSS3PutBucketReplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?replication"
                  targetPrefix:@""
                 operationName:@"PutBucketReplication"
                   outputClass:nil];
}

- (void)putBucketReplication:(AWSS3PutBucketReplicationRequest *)request
           completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketReplication:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketRequestPayment:(AWSS3PutBucketRequestPaymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?requestPayment"
                  targetPrefix:@""
                 operationName:@"PutBucketRequestPayment"
                   outputClass:nil];
}

- (void)putBucketRequestPayment:(AWSS3PutBucketRequestPaymentRequest *)request
              completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketRequestPayment:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketTagging:(AWSS3PutBucketTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?tagging"
                  targetPrefix:@""
                 operationName:@"PutBucketTagging"
                   outputClass:nil];
}

- (void)putBucketTagging:(AWSS3PutBucketTaggingRequest *)request
       completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketTagging:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketVersioning:(AWSS3PutBucketVersioningRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?versioning"
                  targetPrefix:@""
                 operationName:@"PutBucketVersioning"
                   outputClass:nil];
}

- (void)putBucketVersioning:(AWSS3PutBucketVersioningRequest *)request
          completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketVersioning:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBucketWebsite:(AWSS3PutBucketWebsiteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?website"
                  targetPrefix:@""
                 operationName:@"PutBucketWebsite"
                   outputClass:nil];
}

- (void)putBucketWebsite:(AWSS3PutBucketWebsiteRequest *)request
       completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBucketWebsite:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3PutObjectOutput *> *)putObject:(AWSS3PutObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"PutObject"
                   outputClass:[AWSS3PutObjectOutput class]];
}

- (void)putObject:(AWSS3PutObjectRequest *)request
completionHandler:(void (^)(AWSS3PutObjectOutput *response, NSError *error))completionHandler {
    [[self putObject:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3PutObjectOutput *> * _Nonnull task) {
        AWSS3PutObjectOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3PutObjectAclOutput *> *)putObjectAcl:(AWSS3PutObjectAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}?acl"
                  targetPrefix:@""
                 operationName:@"PutObjectAcl"
                   outputClass:[AWSS3PutObjectAclOutput class]];
}

- (void)putObjectAcl:(AWSS3PutObjectAclRequest *)request
   completionHandler:(void (^)(AWSS3PutObjectAclOutput *response, NSError *error))completionHandler {
    [[self putObjectAcl:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3PutObjectAclOutput *> * _Nonnull task) {
        AWSS3PutObjectAclOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3ReplicateObjectOutput *> *)replicateObject:(AWSS3ReplicateObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"CopyObject"
                   outputClass:[AWSS3ReplicateObjectOutput class]];
}

- (void)replicateObject:(AWSS3ReplicateObjectRequest *)request
      completionHandler:(void (^)(AWSS3ReplicateObjectOutput *response, NSError *error))completionHandler {
    [[self replicateObject:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3ReplicateObjectOutput *> * _Nonnull task) {
        AWSS3ReplicateObjectOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3RestoreObjectOutput *> *)restoreObject:(AWSS3RestoreObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}/{Key+}?restore"
                  targetPrefix:@""
                 operationName:@"RestoreObject"
                   outputClass:[AWSS3RestoreObjectOutput class]];
}

- (void)restoreObject:(AWSS3RestoreObjectRequest *)request
    completionHandler:(void (^)(AWSS3RestoreObjectOutput *response, NSError *error))completionHandler {
    [[self restoreObject:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3RestoreObjectOutput *> * _Nonnull task) {
        AWSS3RestoreObjectOutput *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSS3UploadPartOutput *> *)uploadPart:(AWSS3UploadPartRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"UploadPart"
                   outputClass:[AWSS3UploadPartOutput class]];
}

- (void)uploadPart:(AWSS3UploadPartRequest *)request
 completionHandler:(void (^)(AWSS3UploadPartOutput *response, NSError *error))completionHandler {
    [[self uploadPart:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3UploadPartOutput *> * _Nonnull task) {
        AWSS3UploadPartOutput *result = task.result;
        NSError *error = task.error;
        
        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }
        
        if (completionHandler) {
            completionHandler(result, error);
        }
        
        return nil;
    }];
}

- (AWSTask<AWSS3UploadPartCopyOutput *> *)uploadPartCopy:(AWSS3UploadPartCopyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"UploadPartCopy"
                   outputClass:[AWSS3UploadPartCopyOutput class]];
}

- (void)uploadPartCopy:(AWSS3UploadPartCopyRequest *)request
     completionHandler:(void (^)(AWSS3UploadPartCopyOutput *response, NSError *error))completionHandler {
    [[self uploadPartCopy:request] continueWithBlock:^id _Nullable(AWSTask<AWSS3UploadPartCopyOutput *> * _Nonnull task) {
        AWSS3UploadPartCopyOutput *result = task.result;
        NSError *error = task.error;
        
        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }
        
        if (completionHandler) {
            completionHandler(result, error);
        }
        
        return nil;
    }];
}

@end
