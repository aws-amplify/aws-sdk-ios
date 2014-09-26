/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
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

NSString *const AWSS3APIVersion = @"s3-2006-03-01";

/*
 * AWSS3 Response XML Serializer
 */
@interface AWSS3ResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithResource:(NSString *)resource
                            actionName:(NSString *)actionName
                           outputClass:(Class)outputClass;

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

+ (instancetype)serializerWithResource:(NSString *)resource actionName:(NSString *)actionName outputClass:(Class)outputClass {
    AWSS3ResponseSerializer *serializer = [AWSS3ResponseSerializer serializerWithResource:resource actionName:actionName];
    serializer.outputClass = outputClass;

    return serializer;
}

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
            responseObject = [MTLJSONAdapter modelOfClass:self.outputClass
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
       && [error.domain isEqualToString:AWSS3ErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSS3ErrorExpiredToken:
            case AWSS3ErrorInvalidAccessKeyId:
            case AWSS3ErrorInvalidToken:
            case AWSS3ErrorTokenRefreshRequired:
                retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
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

+ (instancetype)defaultS3 {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSS3 *_defaultS3 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultS3 = [[AWSS3 alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultS3;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceS3];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSS3RequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{
                                   @"Host" : _configuration.endpoint.hostName,
                                   };

        _networking = [AWSNetworking networking:_configuration];

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

- (BFTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AWSHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    if (!request) {
        request = [AWSRequest new];
    }

    AWSNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[MTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }
    networkingRequest.shouldWriteDirectly = [[request valueForKey:@"shouldWriteDirectly"] boolValue];
    networkingRequest.downloadingFileURL = request.downloadingFileURL;
    networkingRequest.HTTPMethod = HTTPMethod;
    networkingRequest.responseSerializer = [AWSS3ResponseSerializer serializerWithResource:AWSS3APIVersion
                                                                                actionName:operationName
                                                                               outputClass:outputClass];
    networkingRequest.requestSerializer = [AWSXMLRequestSerializer serializerWithResource:AWSS3APIVersion
                                                                               actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)abortMultipartUpload:(AWSS3AbortMultipartUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"AbortMultipartUpload"
                   outputClass:nil];
}

- (BFTask *)completeMultipartUpload:(AWSS3CompleteMultipartUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"CompleteMultipartUpload"
                   outputClass:[AWSS3CompleteMultipartUploadOutput class]];
}

- (BFTask *)createBucket:(AWSS3CreateBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"CreateBucket"
                   outputClass:[AWSS3CreateBucketOutput class]];
}

- (BFTask *)createMultipartUpload:(AWSS3CreateMultipartUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}/{Key+}?uploads"
                  targetPrefix:@""
                 operationName:@"CreateMultipartUpload"
                   outputClass:[AWSS3CreateMultipartUploadOutput class]];
}

- (BFTask *)deleteBucket:(AWSS3DeleteBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"DeleteBucket"
                   outputClass:nil];
}

- (BFTask *)deleteBucketCors:(AWSS3DeleteBucketCorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?cors"
                  targetPrefix:@""
                 operationName:@"DeleteBucketCors"
                   outputClass:nil];
}

- (BFTask *)deleteBucketLifecycle:(AWSS3DeleteBucketLifecycleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"DeleteBucketLifecycle"
                   outputClass:nil];
}

- (BFTask *)deleteBucketPolicy:(AWSS3DeleteBucketPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?policy"
                  targetPrefix:@""
                 operationName:@"DeleteBucketPolicy"
                   outputClass:nil];
}

- (BFTask *)deleteBucketTagging:(AWSS3DeleteBucketTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?tagging"
                  targetPrefix:@""
                 operationName:@"DeleteBucketTagging"
                   outputClass:nil];
}

- (BFTask *)deleteBucketWebsite:(AWSS3DeleteBucketWebsiteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}?website"
                  targetPrefix:@""
                 operationName:@"DeleteBucketWebsite"
                   outputClass:nil];
}

- (BFTask *)deleteObject:(AWSS3DeleteObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"DeleteObject"
                   outputClass:[AWSS3DeleteObjectOutput class]];
}

- (BFTask *)deleteObjects:(AWSS3DeleteObjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}?delete"
                  targetPrefix:@""
                 operationName:@"DeleteObjects"
                   outputClass:[AWSS3DeleteObjectsOutput class]];
}

- (BFTask *)getBucketAcl:(AWSS3GetBucketAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?acl"
                  targetPrefix:@""
                 operationName:@"GetBucketAcl"
                   outputClass:[AWSS3GetBucketAclOutput class]];
}

- (BFTask *)getBucketCors:(AWSS3GetBucketCorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?cors"
                  targetPrefix:@""
                 operationName:@"GetBucketCors"
                   outputClass:[AWSS3GetBucketCorsOutput class]];
}

- (BFTask *)getBucketLifecycle:(AWSS3GetBucketLifecycleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"GetBucketLifecycle"
                   outputClass:[AWSS3GetBucketLifecycleOutput class]];
}

- (BFTask *)getBucketLocation:(AWSS3GetBucketLocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?location"
                  targetPrefix:@""
                 operationName:@"GetBucketLocation"
                   outputClass:[AWSS3GetBucketLocationOutput class]];
}

- (BFTask *)getBucketLogging:(AWSS3GetBucketLoggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?logging"
                  targetPrefix:@""
                 operationName:@"GetBucketLogging"
                   outputClass:[AWSS3GetBucketLoggingOutput class]];
}

- (BFTask *)getBucketNotification:(AWSS3GetBucketNotificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?notification"
                  targetPrefix:@""
                 operationName:@"GetBucketNotification"
                   outputClass:[AWSS3GetBucketNotificationOutput class]];
}

- (BFTask *)getBucketPolicy:(AWSS3GetBucketPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?policy"
                  targetPrefix:@""
                 operationName:@"GetBucketPolicy"
                   outputClass:[AWSS3GetBucketPolicyOutput class]];
}

- (BFTask *)getBucketRequestPayment:(AWSS3GetBucketRequestPaymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?requestPayment"
                  targetPrefix:@""
                 operationName:@"GetBucketRequestPayment"
                   outputClass:[AWSS3GetBucketRequestPaymentOutput class]];
}

- (BFTask *)getBucketTagging:(AWSS3GetBucketTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?tagging"
                  targetPrefix:@""
                 operationName:@"GetBucketTagging"
                   outputClass:[AWSS3GetBucketTaggingOutput class]];
}

- (BFTask *)getBucketVersioning:(AWSS3GetBucketVersioningRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?versioning"
                  targetPrefix:@""
                 operationName:@"GetBucketVersioning"
                   outputClass:[AWSS3GetBucketVersioningOutput class]];
}

- (BFTask *)getBucketWebsite:(AWSS3GetBucketWebsiteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?website"
                  targetPrefix:@""
                 operationName:@"GetBucketWebsite"
                   outputClass:[AWSS3GetBucketWebsiteOutput class]];
}

- (BFTask *)getObject:(AWSS3GetObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"GetObject"
                   outputClass:[AWSS3GetObjectOutput class]];
}

- (BFTask *)getObjectAcl:(AWSS3GetObjectAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}?acl"
                  targetPrefix:@""
                 operationName:@"GetObjectAcl"
                   outputClass:[AWSS3GetObjectAclOutput class]];
}

- (BFTask *)getObjectTorrent:(AWSS3GetObjectTorrentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}?torrent"
                  targetPrefix:@""
                 operationName:@"GetObjectTorrent"
                   outputClass:[AWSS3GetObjectTorrentOutput class]];
}

- (BFTask *)headBucket:(AWSS3HeadBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodHEAD
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"HeadBucket"
                   outputClass:nil];
}

- (BFTask *)headObject:(AWSS3HeadObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodHEAD
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"HeadObject"
                   outputClass:[AWSS3HeadObjectOutput class]];
}

- (BFTask *)listBuckets:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListBuckets"
                   outputClass:[AWSS3ListBucketsOutput class]];
}

- (BFTask *)listMultipartUploads:(AWSS3ListMultipartUploadsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?uploads"
                  targetPrefix:@""
                 operationName:@"ListMultipartUploads"
                   outputClass:[AWSS3ListMultipartUploadsOutput class]];
}

- (BFTask *)listObjectVersions:(AWSS3ListObjectVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}?versions"
                  targetPrefix:@""
                 operationName:@"ListObjectVersions"
                   outputClass:[AWSS3ListObjectVersionsOutput class]];
}

- (BFTask *)listObjects:(AWSS3ListObjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}"
                  targetPrefix:@""
                 operationName:@"ListObjects"
                   outputClass:[AWSS3ListObjectsOutput class]];
}

- (BFTask *)listParts:(AWSS3ListPartsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"ListParts"
                   outputClass:[AWSS3ListPartsOutput class]];
}

- (BFTask *)putBucketAcl:(AWSS3PutBucketAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?acl"
                  targetPrefix:@""
                 operationName:@"PutBucketAcl"
                   outputClass:nil];
}

- (BFTask *)putBucketCors:(AWSS3PutBucketCorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?cors"
                  targetPrefix:@""
                 operationName:@"PutBucketCors"
                   outputClass:nil];
}

- (BFTask *)putBucketLifecycle:(AWSS3PutBucketLifecycleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?lifecycle"
                  targetPrefix:@""
                 operationName:@"PutBucketLifecycle"
                   outputClass:nil];
}

- (BFTask *)putBucketLogging:(AWSS3PutBucketLoggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?logging"
                  targetPrefix:@""
                 operationName:@"PutBucketLogging"
                   outputClass:nil];
}

- (BFTask *)putBucketNotification:(AWSS3PutBucketNotificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?notification"
                  targetPrefix:@""
                 operationName:@"PutBucketNotification"
                   outputClass:nil];
}

- (BFTask *)putBucketPolicy:(AWSS3PutBucketPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?policy"
                  targetPrefix:@""
                 operationName:@"PutBucketPolicy"
                   outputClass:nil];
}

- (BFTask *)putBucketRequestPayment:(AWSS3PutBucketRequestPaymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?requestPayment"
                  targetPrefix:@""
                 operationName:@"PutBucketRequestPayment"
                   outputClass:nil];
}

- (BFTask *)putBucketTagging:(AWSS3PutBucketTaggingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?tagging"
                  targetPrefix:@""
                 operationName:@"PutBucketTagging"
                   outputClass:nil];
}

- (BFTask *)putBucketVersioning:(AWSS3PutBucketVersioningRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?versioning"
                  targetPrefix:@""
                 operationName:@"PutBucketVersioning"
                   outputClass:nil];
}

- (BFTask *)putBucketWebsite:(AWSS3PutBucketWebsiteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}?website"
                  targetPrefix:@""
                 operationName:@"PutBucketWebsite"
                   outputClass:nil];
}

- (BFTask *)putObject:(AWSS3PutObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"PutObject"
                   outputClass:[AWSS3PutObjectOutput class]];
}

- (BFTask *)putObjectAcl:(AWSS3PutObjectAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}?acl"
                  targetPrefix:@""
                 operationName:@"PutObjectAcl"
                   outputClass:nil];
}

- (BFTask *)replicateObject:(AWSS3ReplicateObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"ReplicateObject"
                   outputClass:[AWSS3ReplicateObjectOutput class]];
}

- (BFTask *)restoreObject:(AWSS3RestoreObjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/{Bucket}/{Key+}?restore"
                  targetPrefix:@""
                 operationName:@"RestoreObject"
                   outputClass:nil];
}

- (BFTask *)uploadPart:(AWSS3UploadPartRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"UploadPart"
                   outputClass:[AWSS3UploadPartOutput class]];
}

- (BFTask *)uploadPartCopy:(AWSS3UploadPartCopyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/{Bucket}/{Key+}"
                  targetPrefix:@""
                 operationName:@"UploadPartCopy"
                   outputClass:[AWSS3UploadPartCopyOutput class]];
}

@end
