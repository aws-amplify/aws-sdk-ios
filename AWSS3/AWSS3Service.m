/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

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

NSString *const AWSS3APIVersion = @"s3-2006-03-01";

/*
 * AWSS3 Response XML Serializer
 */
@interface AWSS3ResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSS3ResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDenied" : @(AWSS3ErrorAccessDenied),
                            @"ExpiredToken" : @(AWSS3ErrorExpiredToken),
                            @"InvalidAccessKeyId" : @(AWSS3ErrorInvalidAccessKeyId),
                            @"InvalidToken" : @(AWSS3ErrorInvalidToken),
                            @"SignatureDoesNotMatch" : @(AWSS3ErrorSignatureDoesNotMatch),
                            @"TokenRefreshRequired" : @(AWSS3ErrorTokenRefreshRequired),
                            @"BucketAlreadyExists" : @(AWSS3ErrorBucketAlreadyExists),
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
                                         userInfo:errorInfo
                          ];
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
        if ([error.domain isEqualToString:AWSS3ErrorDomain]) {
            switch (error.code) {
                case AWSS3ErrorExpiredToken:
                case AWSS3ErrorInvalidAccessKeyId:
                case AWSS3ErrorInvalidToken:
                case AWSS3ErrorTokenRefreshRequired:
                    retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                    break;
                    
                case AWSS3ErrorSignatureDoesNotMatch:
                    retryType = AWSNetworkingRetryTypeShouldRetry;
                    break;
                    
                default:
                    break;
            }
        } else if ([error.domain isEqualToString:AWSGeneralErrorDomain]) {
            switch (error.code) {
                case AWSGeneralErrorSignatureDoesNotMatch:
                    //may happened right after generating AWS temporary credentials due to the massively distributed nature of Amazon S3, just retry the request
                    retryType = AWSNetworkingRetryTypeShouldRetry;
                    break;
                    
                default:
                    break;
            }
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
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSS3 *_defaultS3 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultS3 = [[AWSS3 alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultS3;
}

+ (void)registerS3WithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSS3 alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)S3ForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
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

- (AWSTask *)abortMultipartUpload:(AWSS3AbortMultipartUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"AbortMultipartUpload"
                   outputClass:nil];
}

- (AWSTask *)completeMultipartUpload:(AWSS3CompleteMultipartUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"CompleteMultipartUpload"
                   outputClass:[AWSS3CompleteMultipartUploadOutput class]];
}

- (AWSTask *)createBucket:(AWSS3CreateBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"CreateBucket"
                   outputClass:[AWSS3CreateBucketOutput class]];
}

- (AWSTask *)createMultipartUpload:(AWSS3CreateMultipartUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}/{Key+}?uploads"
                  targetPrefix:@""
                 operationName:@"CreateMultipartUpload"
                   outputClass:[AWSS3CreateMultipartUploadOutput class]];
}

- (AWSTask *)deleteBucket:(AWSS3DeleteBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"DeleteBucket"
                   outputClass:nil];
}

- (AWSTask *)deleteBucketCors:(AWSS3DeleteBucketCorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?cors"
                  targetPrefix:@""
                 operationName:@"DeleteBucketCors"
                   outputClass:nil];
}

- (AWSTask *)deleteBucketLifecycle:(AWSS3DeleteBucketLifecycleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"DeleteBucketLifecycle"
                   outputClass:nil];
}

- (AWSTask *)deleteBucketPolicy:(AWSS3DeleteBucketPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?policy"
                  targetPrefix:@""
                 operationName:@"DeleteBucketPolicy"
                   outputClass:nil];
}

- (AWSTask *)deleteBucketTagging:(AWSS3DeleteBucketTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?tagging"
                  targetPrefix:@""
                 operationName:@"DeleteBucketTagging"
                   outputClass:nil];
}

- (AWSTask *)deleteBucketWebsite:(AWSS3DeleteBucketWebsiteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?website"
                  targetPrefix:@""
                 operationName:@"DeleteBucketWebsite"
                   outputClass:nil];
}

- (AWSTask *)deleteObject:(AWSS3DeleteObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"DeleteObject"
                   outputClass:[AWSS3DeleteObjectOutput class]];
}

- (AWSTask *)deleteObjects:(AWSS3DeleteObjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}?delete"
                  targetPrefix:@""
                 operationName:@"DeleteObjects"
                   outputClass:[AWSS3DeleteObjectsOutput class]];
}

- (AWSTask *)getBucketAcl:(AWSS3GetBucketAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?acl"
                  targetPrefix:@""
                 operationName:@"GetBucketAcl"
                   outputClass:[AWSS3GetBucketAclOutput class]];
}

- (AWSTask *)getBucketCors:(AWSS3GetBucketCorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?cors"
                  targetPrefix:@""
                 operationName:@"GetBucketCors"
                   outputClass:[AWSS3GetBucketCorsOutput class]];
}

- (AWSTask *)getBucketLifecycle:(AWSS3GetBucketLifecycleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"GetBucketLifecycle"
                   outputClass:[AWSS3GetBucketLifecycleOutput class]];
}

- (AWSTask *)getBucketLocation:(AWSS3GetBucketLocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?location"
                  targetPrefix:@""
                 operationName:@"GetBucketLocation"
                   outputClass:[AWSS3GetBucketLocationOutput class]];
}

- (AWSTask *)getBucketLogging:(AWSS3GetBucketLoggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?logging"
                  targetPrefix:@""
                 operationName:@"GetBucketLogging"
                   outputClass:[AWSS3GetBucketLoggingOutput class]];
}

- (AWSTask *)getBucketNotification:(AWSS3GetBucketNotificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?notification"
                  targetPrefix:@""
                 operationName:@"GetBucketNotification"
                   outputClass:[AWSS3GetBucketNotificationOutput class]];
}

- (AWSTask *)getBucketPolicy:(AWSS3GetBucketPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?policy"
                  targetPrefix:@""
                 operationName:@"GetBucketPolicy"
                   outputClass:[AWSS3GetBucketPolicyOutput class]];
}

- (AWSTask *)getBucketRequestPayment:(AWSS3GetBucketRequestPaymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?requestPayment"
                  targetPrefix:@""
                 operationName:@"GetBucketRequestPayment"
                   outputClass:[AWSS3GetBucketRequestPaymentOutput class]];
}

- (AWSTask *)getBucketTagging:(AWSS3GetBucketTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?tagging"
                  targetPrefix:@""
                 operationName:@"GetBucketTagging"
                   outputClass:[AWSS3GetBucketTaggingOutput class]];
}

- (AWSTask *)getBucketVersioning:(AWSS3GetBucketVersioningRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?versioning"
                  targetPrefix:@""
                 operationName:@"GetBucketVersioning"
                   outputClass:[AWSS3GetBucketVersioningOutput class]];
}

- (AWSTask *)getBucketWebsite:(AWSS3GetBucketWebsiteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?website"
                  targetPrefix:@""
                 operationName:@"GetBucketWebsite"
                   outputClass:[AWSS3GetBucketWebsiteOutput class]];
}

- (AWSTask *)getObject:(AWSS3GetObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"GetObject"
                   outputClass:[AWSS3GetObjectOutput class]];
}

- (AWSTask *)getObjectAcl:(AWSS3GetObjectAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}?acl"
                  targetPrefix:@""
                 operationName:@"GetObjectAcl"
                   outputClass:[AWSS3GetObjectAclOutput class]];
}

- (AWSTask *)getObjectTorrent:(AWSS3GetObjectTorrentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}?torrent"
                  targetPrefix:@""
                 operationName:@"GetObjectTorrent"
                   outputClass:[AWSS3GetObjectTorrentOutput class]];
}

- (AWSTask *)headBucket:(AWSS3HeadBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodHEAD
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"HeadBucket"
                   outputClass:nil];
}

- (AWSTask *)headObject:(AWSS3HeadObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodHEAD
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"HeadObject"
                   outputClass:[AWSS3HeadObjectOutput class]];
}

- (AWSTask *)listBuckets:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListBuckets"
                   outputClass:[AWSS3ListBucketsOutput class]];
}

- (AWSTask *)listMultipartUploads:(AWSS3ListMultipartUploadsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?uploads"
                  targetPrefix:@""
                 operationName:@"ListMultipartUploads"
                   outputClass:[AWSS3ListMultipartUploadsOutput class]];
}

- (AWSTask *)listObjectVersions:(AWSS3ListObjectVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?versions"
                  targetPrefix:@""
                 operationName:@"ListObjectVersions"
                   outputClass:[AWSS3ListObjectVersionsOutput class]];
}

- (AWSTask *)listObjects:(AWSS3ListObjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"ListObjects"
                   outputClass:[AWSS3ListObjectsOutput class]];
}

- (AWSTask *)listParts:(AWSS3ListPartsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"ListParts"
                   outputClass:[AWSS3ListPartsOutput class]];
}

- (AWSTask *)putBucketAcl:(AWSS3PutBucketAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?acl"
                  targetPrefix:@""
                 operationName:@"PutBucketAcl"
                   outputClass:nil];
}

- (AWSTask *)putBucketCors:(AWSS3PutBucketCorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?cors"
                  targetPrefix:@""
                 operationName:@"PutBucketCors"
                   outputClass:nil];
}

- (AWSTask *)putBucketLifecycle:(AWSS3PutBucketLifecycleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"PutBucketLifecycle"
                   outputClass:nil];
}

- (AWSTask *)putBucketLogging:(AWSS3PutBucketLoggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?logging"
                  targetPrefix:@""
                 operationName:@"PutBucketLogging"
                   outputClass:nil];
}

- (AWSTask *)putBucketNotification:(AWSS3PutBucketNotificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?notification"
                  targetPrefix:@""
                 operationName:@"PutBucketNotification"
                   outputClass:nil];
}

- (AWSTask *)putBucketPolicy:(AWSS3PutBucketPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?policy"
                  targetPrefix:@""
                 operationName:@"PutBucketPolicy"
                   outputClass:nil];
}

- (AWSTask *)putBucketRequestPayment:(AWSS3PutBucketRequestPaymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?requestPayment"
                  targetPrefix:@""
                 operationName:@"PutBucketRequestPayment"
                   outputClass:nil];
}

- (AWSTask *)putBucketTagging:(AWSS3PutBucketTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?tagging"
                  targetPrefix:@""
                 operationName:@"PutBucketTagging"
                   outputClass:nil];
}

- (AWSTask *)putBucketVersioning:(AWSS3PutBucketVersioningRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?versioning"
                  targetPrefix:@""
                 operationName:@"PutBucketVersioning"
                   outputClass:nil];
}

- (AWSTask *)putBucketWebsite:(AWSS3PutBucketWebsiteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?website"
                  targetPrefix:@""
                 operationName:@"PutBucketWebsite"
                   outputClass:nil];
}

- (AWSTask *)putObject:(AWSS3PutObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"PutObject"
                   outputClass:[AWSS3PutObjectOutput class]];
}

- (AWSTask *)putObjectAcl:(AWSS3PutObjectAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}?acl"
                  targetPrefix:@""
                 operationName:@"PutObjectAcl"
                   outputClass:nil];
}

- (AWSTask *)replicateObject:(AWSS3ReplicateObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"CopyObject"
                   outputClass:[AWSS3ReplicateObjectOutput class]];
}

- (AWSTask *)restoreObject:(AWSS3RestoreObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}/{Key+}?restore"
                  targetPrefix:@""
                 operationName:@"RestoreObject"
                   outputClass:nil];
}

- (AWSTask *)uploadPart:(AWSS3UploadPartRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"UploadPart"
                   outputClass:[AWSS3UploadPartOutput class]];
}

- (AWSTask *)uploadPartCopy:(AWSS3UploadPartCopyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"UploadPartCopy"
                   outputClass:[AWSS3UploadPartCopyOutput class]];
}

@end
