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

#import "AWSstoragegatewayService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSstoragegatewayResources.h"

static NSString *const AWSInfostoragegateway = @"storagegateway";
NSString *const AWSstoragegatewaySDKVersion = @"2.13.2";


@interface AWSstoragegatewayResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSstoragegatewayResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalServerError" : @(AWSstoragegatewayErrorInternalServer),
                            @"InvalidGatewayRequestException" : @(AWSstoragegatewayErrorInvalidGatewayRequest),
                            @"ServiceUnavailableError" : @(AWSstoragegatewayErrorServiceUnavailable),
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
	                *error = [NSError errorWithDomain:AWSstoragegatewayErrorDomain
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
        *error = [NSError errorWithDomain:AWSstoragegatewayErrorDomain
                                     code:AWSstoragegatewayErrorUnknown
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

@interface AWSstoragegatewayRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSstoragegatewayRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSstoragegateway()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSstoragegateway

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSstoragegatewaySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSstoragegateway versions need to match. Check your SDK installation. AWSCore: %@ AWSstoragegateway: %@", AWSiOSSDKVersion, AWSstoragegatewaySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultstoragegateway {
    static AWSstoragegateway *_defaultstoragegateway = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfostoragegateway];
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
        _defaultstoragegateway = [[AWSstoragegateway alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultstoragegateway;
}

+ (void)registerstoragegatewayWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSstoragegateway alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)storagegatewayForKey:(NSString *)key {
    @synchronized(self) {
        AWSstoragegateway *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfostoragegateway
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSstoragegateway registerstoragegatewayWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removestoragegatewayForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultstoragegateway` or `+ storagegatewayForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicestoragegateway
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicestoragegateway];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSstoragegatewayRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSstoragegatewayResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSstoragegatewayResponseSerializer alloc] initWithJSONDefinition:[[AWSstoragegatewayResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSstoragegatewayActivateGatewayOutput *> *)activateGateway:(AWSstoragegatewayActivateGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ActivateGateway"
                   outputClass:[AWSstoragegatewayActivateGatewayOutput class]];
}

- (void)activateGateway:(AWSstoragegatewayActivateGatewayInput *)request
     completionHandler:(void (^)(AWSstoragegatewayActivateGatewayOutput *response, NSError *error))completionHandler {
    [[self activateGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayActivateGatewayOutput *> * _Nonnull task) {
        AWSstoragegatewayActivateGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayAddCacheOutput *> *)addCache:(AWSstoragegatewayAddCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AddCache"
                   outputClass:[AWSstoragegatewayAddCacheOutput class]];
}

- (void)addCache:(AWSstoragegatewayAddCacheInput *)request
     completionHandler:(void (^)(AWSstoragegatewayAddCacheOutput *response, NSError *error))completionHandler {
    [[self addCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayAddCacheOutput *> * _Nonnull task) {
        AWSstoragegatewayAddCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayAddTagsToResourceOutput *> *)addTagsToResource:(AWSstoragegatewayAddTagsToResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AddTagsToResource"
                   outputClass:[AWSstoragegatewayAddTagsToResourceOutput class]];
}

- (void)addTagsToResource:(AWSstoragegatewayAddTagsToResourceInput *)request
     completionHandler:(void (^)(AWSstoragegatewayAddTagsToResourceOutput *response, NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayAddTagsToResourceOutput *> * _Nonnull task) {
        AWSstoragegatewayAddTagsToResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayAddUploadBufferOutput *> *)addUploadBuffer:(AWSstoragegatewayAddUploadBufferInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AddUploadBuffer"
                   outputClass:[AWSstoragegatewayAddUploadBufferOutput class]];
}

- (void)addUploadBuffer:(AWSstoragegatewayAddUploadBufferInput *)request
     completionHandler:(void (^)(AWSstoragegatewayAddUploadBufferOutput *response, NSError *error))completionHandler {
    [[self addUploadBuffer:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayAddUploadBufferOutput *> * _Nonnull task) {
        AWSstoragegatewayAddUploadBufferOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayAddWorkingStorageOutput *> *)addWorkingStorage:(AWSstoragegatewayAddWorkingStorageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AddWorkingStorage"
                   outputClass:[AWSstoragegatewayAddWorkingStorageOutput class]];
}

- (void)addWorkingStorage:(AWSstoragegatewayAddWorkingStorageInput *)request
     completionHandler:(void (^)(AWSstoragegatewayAddWorkingStorageOutput *response, NSError *error))completionHandler {
    [[self addWorkingStorage:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayAddWorkingStorageOutput *> * _Nonnull task) {
        AWSstoragegatewayAddWorkingStorageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayAssignTapePoolOutput *> *)assignTapePool:(AWSstoragegatewayAssignTapePoolInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AssignTapePool"
                   outputClass:[AWSstoragegatewayAssignTapePoolOutput class]];
}

- (void)assignTapePool:(AWSstoragegatewayAssignTapePoolInput *)request
     completionHandler:(void (^)(AWSstoragegatewayAssignTapePoolOutput *response, NSError *error))completionHandler {
    [[self assignTapePool:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayAssignTapePoolOutput *> * _Nonnull task) {
        AWSstoragegatewayAssignTapePoolOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayAttachVolumeOutput *> *)attachVolume:(AWSstoragegatewayAttachVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AttachVolume"
                   outputClass:[AWSstoragegatewayAttachVolumeOutput class]];
}

- (void)attachVolume:(AWSstoragegatewayAttachVolumeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayAttachVolumeOutput *response, NSError *error))completionHandler {
    [[self attachVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayAttachVolumeOutput *> * _Nonnull task) {
        AWSstoragegatewayAttachVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCancelArchivalOutput *> *)cancelArchival:(AWSstoragegatewayCancelArchivalInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CancelArchival"
                   outputClass:[AWSstoragegatewayCancelArchivalOutput class]];
}

- (void)cancelArchival:(AWSstoragegatewayCancelArchivalInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCancelArchivalOutput *response, NSError *error))completionHandler {
    [[self cancelArchival:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCancelArchivalOutput *> * _Nonnull task) {
        AWSstoragegatewayCancelArchivalOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCancelRetrievalOutput *> *)cancelRetrieval:(AWSstoragegatewayCancelRetrievalInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CancelRetrieval"
                   outputClass:[AWSstoragegatewayCancelRetrievalOutput class]];
}

- (void)cancelRetrieval:(AWSstoragegatewayCancelRetrievalInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCancelRetrievalOutput *response, NSError *error))completionHandler {
    [[self cancelRetrieval:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCancelRetrievalOutput *> * _Nonnull task) {
        AWSstoragegatewayCancelRetrievalOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCreateCachediSCSIVolumeOutput *> *)createCachediSCSIVolume:(AWSstoragegatewayCreateCachediSCSIVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateCachediSCSIVolume"
                   outputClass:[AWSstoragegatewayCreateCachediSCSIVolumeOutput class]];
}

- (void)createCachediSCSIVolume:(AWSstoragegatewayCreateCachediSCSIVolumeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCreateCachediSCSIVolumeOutput *response, NSError *error))completionHandler {
    [[self createCachediSCSIVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCreateCachediSCSIVolumeOutput *> * _Nonnull task) {
        AWSstoragegatewayCreateCachediSCSIVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCreateNFSFileShareOutput *> *)createNFSFileShare:(AWSstoragegatewayCreateNFSFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateNFSFileShare"
                   outputClass:[AWSstoragegatewayCreateNFSFileShareOutput class]];
}

- (void)createNFSFileShare:(AWSstoragegatewayCreateNFSFileShareInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCreateNFSFileShareOutput *response, NSError *error))completionHandler {
    [[self createNFSFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCreateNFSFileShareOutput *> * _Nonnull task) {
        AWSstoragegatewayCreateNFSFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCreateSMBFileShareOutput *> *)createSMBFileShare:(AWSstoragegatewayCreateSMBFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateSMBFileShare"
                   outputClass:[AWSstoragegatewayCreateSMBFileShareOutput class]];
}

- (void)createSMBFileShare:(AWSstoragegatewayCreateSMBFileShareInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCreateSMBFileShareOutput *response, NSError *error))completionHandler {
    [[self createSMBFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCreateSMBFileShareOutput *> * _Nonnull task) {
        AWSstoragegatewayCreateSMBFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCreateSnapshotOutput *> *)createSnapshot:(AWSstoragegatewayCreateSnapshotInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateSnapshot"
                   outputClass:[AWSstoragegatewayCreateSnapshotOutput class]];
}

- (void)createSnapshot:(AWSstoragegatewayCreateSnapshotInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCreateSnapshotOutput *response, NSError *error))completionHandler {
    [[self createSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCreateSnapshotOutput *> * _Nonnull task) {
        AWSstoragegatewayCreateSnapshotOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *> *)createSnapshotFromVolumeRecoveryPoint:(AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateSnapshotFromVolumeRecoveryPoint"
                   outputClass:[AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput class]];
}

- (void)createSnapshotFromVolumeRecoveryPoint:(AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *response, NSError *error))completionHandler {
    [[self createSnapshotFromVolumeRecoveryPoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *> * _Nonnull task) {
        AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCreateStorediSCSIVolumeOutput *> *)createStorediSCSIVolume:(AWSstoragegatewayCreateStorediSCSIVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateStorediSCSIVolume"
                   outputClass:[AWSstoragegatewayCreateStorediSCSIVolumeOutput class]];
}

- (void)createStorediSCSIVolume:(AWSstoragegatewayCreateStorediSCSIVolumeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCreateStorediSCSIVolumeOutput *response, NSError *error))completionHandler {
    [[self createStorediSCSIVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCreateStorediSCSIVolumeOutput *> * _Nonnull task) {
        AWSstoragegatewayCreateStorediSCSIVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCreateTapeWithBarcodeOutput *> *)createTapeWithBarcode:(AWSstoragegatewayCreateTapeWithBarcodeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateTapeWithBarcode"
                   outputClass:[AWSstoragegatewayCreateTapeWithBarcodeOutput class]];
}

- (void)createTapeWithBarcode:(AWSstoragegatewayCreateTapeWithBarcodeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCreateTapeWithBarcodeOutput *response, NSError *error))completionHandler {
    [[self createTapeWithBarcode:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCreateTapeWithBarcodeOutput *> * _Nonnull task) {
        AWSstoragegatewayCreateTapeWithBarcodeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayCreateTapesOutput *> *)createTapes:(AWSstoragegatewayCreateTapesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateTapes"
                   outputClass:[AWSstoragegatewayCreateTapesOutput class]];
}

- (void)createTapes:(AWSstoragegatewayCreateTapesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayCreateTapesOutput *response, NSError *error))completionHandler {
    [[self createTapes:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayCreateTapesOutput *> * _Nonnull task) {
        AWSstoragegatewayCreateTapesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput *> *)deleteAutomaticTapeCreationPolicy:(AWSstoragegatewayDeleteAutomaticTapeCreationPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteAutomaticTapeCreationPolicy"
                   outputClass:[AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput class]];
}

- (void)deleteAutomaticTapeCreationPolicy:(AWSstoragegatewayDeleteAutomaticTapeCreationPolicyInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput *response, NSError *error))completionHandler {
    [[self deleteAutomaticTapeCreationPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput *> * _Nonnull task) {
        AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDeleteBandwidthRateLimitOutput *> *)deleteBandwidthRateLimit:(AWSstoragegatewayDeleteBandwidthRateLimitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteBandwidthRateLimit"
                   outputClass:[AWSstoragegatewayDeleteBandwidthRateLimitOutput class]];
}

- (void)deleteBandwidthRateLimit:(AWSstoragegatewayDeleteBandwidthRateLimitInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDeleteBandwidthRateLimitOutput *response, NSError *error))completionHandler {
    [[self deleteBandwidthRateLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDeleteBandwidthRateLimitOutput *> * _Nonnull task) {
        AWSstoragegatewayDeleteBandwidthRateLimitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDeleteChapCredentialsOutput *> *)deleteChapCredentials:(AWSstoragegatewayDeleteChapCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteChapCredentials"
                   outputClass:[AWSstoragegatewayDeleteChapCredentialsOutput class]];
}

- (void)deleteChapCredentials:(AWSstoragegatewayDeleteChapCredentialsInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDeleteChapCredentialsOutput *response, NSError *error))completionHandler {
    [[self deleteChapCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDeleteChapCredentialsOutput *> * _Nonnull task) {
        AWSstoragegatewayDeleteChapCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDeleteFileShareOutput *> *)deleteFileShare:(AWSstoragegatewayDeleteFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteFileShare"
                   outputClass:[AWSstoragegatewayDeleteFileShareOutput class]];
}

- (void)deleteFileShare:(AWSstoragegatewayDeleteFileShareInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDeleteFileShareOutput *response, NSError *error))completionHandler {
    [[self deleteFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDeleteFileShareOutput *> * _Nonnull task) {
        AWSstoragegatewayDeleteFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDeleteGatewayOutput *> *)deleteGateway:(AWSstoragegatewayDeleteGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteGateway"
                   outputClass:[AWSstoragegatewayDeleteGatewayOutput class]];
}

- (void)deleteGateway:(AWSstoragegatewayDeleteGatewayInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDeleteGatewayOutput *response, NSError *error))completionHandler {
    [[self deleteGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDeleteGatewayOutput *> * _Nonnull task) {
        AWSstoragegatewayDeleteGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDeleteSnapshotScheduleOutput *> *)deleteSnapshotSchedule:(AWSstoragegatewayDeleteSnapshotScheduleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteSnapshotSchedule"
                   outputClass:[AWSstoragegatewayDeleteSnapshotScheduleOutput class]];
}

- (void)deleteSnapshotSchedule:(AWSstoragegatewayDeleteSnapshotScheduleInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDeleteSnapshotScheduleOutput *response, NSError *error))completionHandler {
    [[self deleteSnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDeleteSnapshotScheduleOutput *> * _Nonnull task) {
        AWSstoragegatewayDeleteSnapshotScheduleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDeleteTapeOutput *> *)deleteTape:(AWSstoragegatewayDeleteTapeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteTape"
                   outputClass:[AWSstoragegatewayDeleteTapeOutput class]];
}

- (void)deleteTape:(AWSstoragegatewayDeleteTapeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDeleteTapeOutput *response, NSError *error))completionHandler {
    [[self deleteTape:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDeleteTapeOutput *> * _Nonnull task) {
        AWSstoragegatewayDeleteTapeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDeleteTapeArchiveOutput *> *)deleteTapeArchive:(AWSstoragegatewayDeleteTapeArchiveInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteTapeArchive"
                   outputClass:[AWSstoragegatewayDeleteTapeArchiveOutput class]];
}

- (void)deleteTapeArchive:(AWSstoragegatewayDeleteTapeArchiveInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDeleteTapeArchiveOutput *response, NSError *error))completionHandler {
    [[self deleteTapeArchive:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDeleteTapeArchiveOutput *> * _Nonnull task) {
        AWSstoragegatewayDeleteTapeArchiveOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDeleteVolumeOutput *> *)deleteVolume:(AWSstoragegatewayDeleteVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteVolume"
                   outputClass:[AWSstoragegatewayDeleteVolumeOutput class]];
}

- (void)deleteVolume:(AWSstoragegatewayDeleteVolumeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDeleteVolumeOutput *response, NSError *error))completionHandler {
    [[self deleteVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDeleteVolumeOutput *> * _Nonnull task) {
        AWSstoragegatewayDeleteVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeAvailabilityMonitorTestOutput *> *)describeAvailabilityMonitorTest:(AWSstoragegatewayDescribeAvailabilityMonitorTestInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeAvailabilityMonitorTest"
                   outputClass:[AWSstoragegatewayDescribeAvailabilityMonitorTestOutput class]];
}

- (void)describeAvailabilityMonitorTest:(AWSstoragegatewayDescribeAvailabilityMonitorTestInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeAvailabilityMonitorTestOutput *response, NSError *error))completionHandler {
    [[self describeAvailabilityMonitorTest:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeAvailabilityMonitorTestOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeAvailabilityMonitorTestOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeBandwidthRateLimitOutput *> *)describeBandwidthRateLimit:(AWSstoragegatewayDescribeBandwidthRateLimitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeBandwidthRateLimit"
                   outputClass:[AWSstoragegatewayDescribeBandwidthRateLimitOutput class]];
}

- (void)describeBandwidthRateLimit:(AWSstoragegatewayDescribeBandwidthRateLimitInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeBandwidthRateLimitOutput *response, NSError *error))completionHandler {
    [[self describeBandwidthRateLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeBandwidthRateLimitOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeBandwidthRateLimitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeCacheOutput *> *)describeCache:(AWSstoragegatewayDescribeCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeCache"
                   outputClass:[AWSstoragegatewayDescribeCacheOutput class]];
}

- (void)describeCache:(AWSstoragegatewayDescribeCacheInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeCacheOutput *response, NSError *error))completionHandler {
    [[self describeCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeCacheOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeCachediSCSIVolumesOutput *> *)describeCachediSCSIVolumes:(AWSstoragegatewayDescribeCachediSCSIVolumesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeCachediSCSIVolumes"
                   outputClass:[AWSstoragegatewayDescribeCachediSCSIVolumesOutput class]];
}

- (void)describeCachediSCSIVolumes:(AWSstoragegatewayDescribeCachediSCSIVolumesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeCachediSCSIVolumesOutput *response, NSError *error))completionHandler {
    [[self describeCachediSCSIVolumes:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeCachediSCSIVolumesOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeCachediSCSIVolumesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeChapCredentialsOutput *> *)describeChapCredentials:(AWSstoragegatewayDescribeChapCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeChapCredentials"
                   outputClass:[AWSstoragegatewayDescribeChapCredentialsOutput class]];
}

- (void)describeChapCredentials:(AWSstoragegatewayDescribeChapCredentialsInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeChapCredentialsOutput *response, NSError *error))completionHandler {
    [[self describeChapCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeChapCredentialsOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeChapCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeGatewayInformationOutput *> *)describeGatewayInformation:(AWSstoragegatewayDescribeGatewayInformationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeGatewayInformation"
                   outputClass:[AWSstoragegatewayDescribeGatewayInformationOutput class]];
}

- (void)describeGatewayInformation:(AWSstoragegatewayDescribeGatewayInformationInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeGatewayInformationOutput *response, NSError *error))completionHandler {
    [[self describeGatewayInformation:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeGatewayInformationOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeGatewayInformationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeMaintenanceStartTimeOutput *> *)describeMaintenanceStartTime:(AWSstoragegatewayDescribeMaintenanceStartTimeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeMaintenanceStartTime"
                   outputClass:[AWSstoragegatewayDescribeMaintenanceStartTimeOutput class]];
}

- (void)describeMaintenanceStartTime:(AWSstoragegatewayDescribeMaintenanceStartTimeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeMaintenanceStartTimeOutput *response, NSError *error))completionHandler {
    [[self describeMaintenanceStartTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeMaintenanceStartTimeOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeMaintenanceStartTimeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeNFSFileSharesOutput *> *)describeNFSFileShares:(AWSstoragegatewayDescribeNFSFileSharesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeNFSFileShares"
                   outputClass:[AWSstoragegatewayDescribeNFSFileSharesOutput class]];
}

- (void)describeNFSFileShares:(AWSstoragegatewayDescribeNFSFileSharesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeNFSFileSharesOutput *response, NSError *error))completionHandler {
    [[self describeNFSFileShares:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeNFSFileSharesOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeNFSFileSharesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeSMBFileSharesOutput *> *)describeSMBFileShares:(AWSstoragegatewayDescribeSMBFileSharesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeSMBFileShares"
                   outputClass:[AWSstoragegatewayDescribeSMBFileSharesOutput class]];
}

- (void)describeSMBFileShares:(AWSstoragegatewayDescribeSMBFileSharesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeSMBFileSharesOutput *response, NSError *error))completionHandler {
    [[self describeSMBFileShares:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeSMBFileSharesOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeSMBFileSharesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeSMBSettingsOutput *> *)describeSMBSettings:(AWSstoragegatewayDescribeSMBSettingsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeSMBSettings"
                   outputClass:[AWSstoragegatewayDescribeSMBSettingsOutput class]];
}

- (void)describeSMBSettings:(AWSstoragegatewayDescribeSMBSettingsInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeSMBSettingsOutput *response, NSError *error))completionHandler {
    [[self describeSMBSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeSMBSettingsOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeSMBSettingsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeSnapshotScheduleOutput *> *)describeSnapshotSchedule:(AWSstoragegatewayDescribeSnapshotScheduleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeSnapshotSchedule"
                   outputClass:[AWSstoragegatewayDescribeSnapshotScheduleOutput class]];
}

- (void)describeSnapshotSchedule:(AWSstoragegatewayDescribeSnapshotScheduleInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeSnapshotScheduleOutput *response, NSError *error))completionHandler {
    [[self describeSnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeSnapshotScheduleOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeSnapshotScheduleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeStorediSCSIVolumesOutput *> *)describeStorediSCSIVolumes:(AWSstoragegatewayDescribeStorediSCSIVolumesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeStorediSCSIVolumes"
                   outputClass:[AWSstoragegatewayDescribeStorediSCSIVolumesOutput class]];
}

- (void)describeStorediSCSIVolumes:(AWSstoragegatewayDescribeStorediSCSIVolumesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeStorediSCSIVolumesOutput *response, NSError *error))completionHandler {
    [[self describeStorediSCSIVolumes:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeStorediSCSIVolumesOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeStorediSCSIVolumesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeTapeArchivesOutput *> *)describeTapeArchives:(AWSstoragegatewayDescribeTapeArchivesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeTapeArchives"
                   outputClass:[AWSstoragegatewayDescribeTapeArchivesOutput class]];
}

- (void)describeTapeArchives:(AWSstoragegatewayDescribeTapeArchivesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeTapeArchivesOutput *response, NSError *error))completionHandler {
    [[self describeTapeArchives:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeTapeArchivesOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeTapeArchivesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeTapeRecoveryPointsOutput *> *)describeTapeRecoveryPoints:(AWSstoragegatewayDescribeTapeRecoveryPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeTapeRecoveryPoints"
                   outputClass:[AWSstoragegatewayDescribeTapeRecoveryPointsOutput class]];
}

- (void)describeTapeRecoveryPoints:(AWSstoragegatewayDescribeTapeRecoveryPointsInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeTapeRecoveryPointsOutput *response, NSError *error))completionHandler {
    [[self describeTapeRecoveryPoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeTapeRecoveryPointsOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeTapeRecoveryPointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeTapesOutput *> *)describeTapes:(AWSstoragegatewayDescribeTapesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeTapes"
                   outputClass:[AWSstoragegatewayDescribeTapesOutput class]];
}

- (void)describeTapes:(AWSstoragegatewayDescribeTapesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeTapesOutput *response, NSError *error))completionHandler {
    [[self describeTapes:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeTapesOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeTapesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeUploadBufferOutput *> *)describeUploadBuffer:(AWSstoragegatewayDescribeUploadBufferInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeUploadBuffer"
                   outputClass:[AWSstoragegatewayDescribeUploadBufferOutput class]];
}

- (void)describeUploadBuffer:(AWSstoragegatewayDescribeUploadBufferInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeUploadBufferOutput *response, NSError *error))completionHandler {
    [[self describeUploadBuffer:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeUploadBufferOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeUploadBufferOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeVTLDevicesOutput *> *)describeVTLDevices:(AWSstoragegatewayDescribeVTLDevicesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeVTLDevices"
                   outputClass:[AWSstoragegatewayDescribeVTLDevicesOutput class]];
}

- (void)describeVTLDevices:(AWSstoragegatewayDescribeVTLDevicesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeVTLDevicesOutput *response, NSError *error))completionHandler {
    [[self describeVTLDevices:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeVTLDevicesOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeVTLDevicesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDescribeWorkingStorageOutput *> *)describeWorkingStorage:(AWSstoragegatewayDescribeWorkingStorageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeWorkingStorage"
                   outputClass:[AWSstoragegatewayDescribeWorkingStorageOutput class]];
}

- (void)describeWorkingStorage:(AWSstoragegatewayDescribeWorkingStorageInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDescribeWorkingStorageOutput *response, NSError *error))completionHandler {
    [[self describeWorkingStorage:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDescribeWorkingStorageOutput *> * _Nonnull task) {
        AWSstoragegatewayDescribeWorkingStorageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDetachVolumeOutput *> *)detachVolume:(AWSstoragegatewayDetachVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DetachVolume"
                   outputClass:[AWSstoragegatewayDetachVolumeOutput class]];
}

- (void)detachVolume:(AWSstoragegatewayDetachVolumeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDetachVolumeOutput *response, NSError *error))completionHandler {
    [[self detachVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDetachVolumeOutput *> * _Nonnull task) {
        AWSstoragegatewayDetachVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayDisableGatewayOutput *> *)disableGateway:(AWSstoragegatewayDisableGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DisableGateway"
                   outputClass:[AWSstoragegatewayDisableGatewayOutput class]];
}

- (void)disableGateway:(AWSstoragegatewayDisableGatewayInput *)request
     completionHandler:(void (^)(AWSstoragegatewayDisableGatewayOutput *response, NSError *error))completionHandler {
    [[self disableGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayDisableGatewayOutput *> * _Nonnull task) {
        AWSstoragegatewayDisableGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayJoinDomainOutput *> *)joinDomain:(AWSstoragegatewayJoinDomainInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"JoinDomain"
                   outputClass:[AWSstoragegatewayJoinDomainOutput class]];
}

- (void)joinDomain:(AWSstoragegatewayJoinDomainInput *)request
     completionHandler:(void (^)(AWSstoragegatewayJoinDomainOutput *response, NSError *error))completionHandler {
    [[self joinDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayJoinDomainOutput *> * _Nonnull task) {
        AWSstoragegatewayJoinDomainOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput *> *)listAutomaticTapeCreationPolicies:(AWSstoragegatewayListAutomaticTapeCreationPoliciesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListAutomaticTapeCreationPolicies"
                   outputClass:[AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput class]];
}

- (void)listAutomaticTapeCreationPolicies:(AWSstoragegatewayListAutomaticTapeCreationPoliciesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput *response, NSError *error))completionHandler {
    [[self listAutomaticTapeCreationPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput *> * _Nonnull task) {
        AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayListFileSharesOutput *> *)listFileShares:(AWSstoragegatewayListFileSharesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListFileShares"
                   outputClass:[AWSstoragegatewayListFileSharesOutput class]];
}

- (void)listFileShares:(AWSstoragegatewayListFileSharesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayListFileSharesOutput *response, NSError *error))completionHandler {
    [[self listFileShares:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayListFileSharesOutput *> * _Nonnull task) {
        AWSstoragegatewayListFileSharesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayListGatewaysOutput *> *)listGateways:(AWSstoragegatewayListGatewaysInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListGateways"
                   outputClass:[AWSstoragegatewayListGatewaysOutput class]];
}

- (void)listGateways:(AWSstoragegatewayListGatewaysInput *)request
     completionHandler:(void (^)(AWSstoragegatewayListGatewaysOutput *response, NSError *error))completionHandler {
    [[self listGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayListGatewaysOutput *> * _Nonnull task) {
        AWSstoragegatewayListGatewaysOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayListLocalDisksOutput *> *)listLocalDisks:(AWSstoragegatewayListLocalDisksInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListLocalDisks"
                   outputClass:[AWSstoragegatewayListLocalDisksOutput class]];
}

- (void)listLocalDisks:(AWSstoragegatewayListLocalDisksInput *)request
     completionHandler:(void (^)(AWSstoragegatewayListLocalDisksOutput *response, NSError *error))completionHandler {
    [[self listLocalDisks:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayListLocalDisksOutput *> * _Nonnull task) {
        AWSstoragegatewayListLocalDisksOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayListTagsForResourceOutput *> *)listTagsForResource:(AWSstoragegatewayListTagsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSstoragegatewayListTagsForResourceOutput class]];
}

- (void)listTagsForResource:(AWSstoragegatewayListTagsForResourceInput *)request
     completionHandler:(void (^)(AWSstoragegatewayListTagsForResourceOutput *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayListTagsForResourceOutput *> * _Nonnull task) {
        AWSstoragegatewayListTagsForResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayListTapesOutput *> *)listTapes:(AWSstoragegatewayListTapesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListTapes"
                   outputClass:[AWSstoragegatewayListTapesOutput class]];
}

- (void)listTapes:(AWSstoragegatewayListTapesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayListTapesOutput *response, NSError *error))completionHandler {
    [[self listTapes:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayListTapesOutput *> * _Nonnull task) {
        AWSstoragegatewayListTapesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayListVolumeInitiatorsOutput *> *)listVolumeInitiators:(AWSstoragegatewayListVolumeInitiatorsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListVolumeInitiators"
                   outputClass:[AWSstoragegatewayListVolumeInitiatorsOutput class]];
}

- (void)listVolumeInitiators:(AWSstoragegatewayListVolumeInitiatorsInput *)request
     completionHandler:(void (^)(AWSstoragegatewayListVolumeInitiatorsOutput *response, NSError *error))completionHandler {
    [[self listVolumeInitiators:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayListVolumeInitiatorsOutput *> * _Nonnull task) {
        AWSstoragegatewayListVolumeInitiatorsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayListVolumeRecoveryPointsOutput *> *)listVolumeRecoveryPoints:(AWSstoragegatewayListVolumeRecoveryPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListVolumeRecoveryPoints"
                   outputClass:[AWSstoragegatewayListVolumeRecoveryPointsOutput class]];
}

- (void)listVolumeRecoveryPoints:(AWSstoragegatewayListVolumeRecoveryPointsInput *)request
     completionHandler:(void (^)(AWSstoragegatewayListVolumeRecoveryPointsOutput *response, NSError *error))completionHandler {
    [[self listVolumeRecoveryPoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayListVolumeRecoveryPointsOutput *> * _Nonnull task) {
        AWSstoragegatewayListVolumeRecoveryPointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayListVolumesOutput *> *)listVolumes:(AWSstoragegatewayListVolumesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListVolumes"
                   outputClass:[AWSstoragegatewayListVolumesOutput class]];
}

- (void)listVolumes:(AWSstoragegatewayListVolumesInput *)request
     completionHandler:(void (^)(AWSstoragegatewayListVolumesOutput *response, NSError *error))completionHandler {
    [[self listVolumes:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayListVolumesOutput *> * _Nonnull task) {
        AWSstoragegatewayListVolumesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayNotifyWhenUploadedOutput *> *)notifyWhenUploaded:(AWSstoragegatewayNotifyWhenUploadedInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"NotifyWhenUploaded"
                   outputClass:[AWSstoragegatewayNotifyWhenUploadedOutput class]];
}

- (void)notifyWhenUploaded:(AWSstoragegatewayNotifyWhenUploadedInput *)request
     completionHandler:(void (^)(AWSstoragegatewayNotifyWhenUploadedOutput *response, NSError *error))completionHandler {
    [[self notifyWhenUploaded:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayNotifyWhenUploadedOutput *> * _Nonnull task) {
        AWSstoragegatewayNotifyWhenUploadedOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayRefreshCacheOutput *> *)refreshCache:(AWSstoragegatewayRefreshCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"RefreshCache"
                   outputClass:[AWSstoragegatewayRefreshCacheOutput class]];
}

- (void)refreshCache:(AWSstoragegatewayRefreshCacheInput *)request
     completionHandler:(void (^)(AWSstoragegatewayRefreshCacheOutput *response, NSError *error))completionHandler {
    [[self refreshCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayRefreshCacheOutput *> * _Nonnull task) {
        AWSstoragegatewayRefreshCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayRemoveTagsFromResourceOutput *> *)removeTagsFromResource:(AWSstoragegatewayRemoveTagsFromResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"RemoveTagsFromResource"
                   outputClass:[AWSstoragegatewayRemoveTagsFromResourceOutput class]];
}

- (void)removeTagsFromResource:(AWSstoragegatewayRemoveTagsFromResourceInput *)request
     completionHandler:(void (^)(AWSstoragegatewayRemoveTagsFromResourceOutput *response, NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayRemoveTagsFromResourceOutput *> * _Nonnull task) {
        AWSstoragegatewayRemoveTagsFromResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayResetCacheOutput *> *)resetCache:(AWSstoragegatewayResetCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ResetCache"
                   outputClass:[AWSstoragegatewayResetCacheOutput class]];
}

- (void)resetCache:(AWSstoragegatewayResetCacheInput *)request
     completionHandler:(void (^)(AWSstoragegatewayResetCacheOutput *response, NSError *error))completionHandler {
    [[self resetCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayResetCacheOutput *> * _Nonnull task) {
        AWSstoragegatewayResetCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayRetrieveTapeArchiveOutput *> *)retrieveTapeArchive:(AWSstoragegatewayRetrieveTapeArchiveInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"RetrieveTapeArchive"
                   outputClass:[AWSstoragegatewayRetrieveTapeArchiveOutput class]];
}

- (void)retrieveTapeArchive:(AWSstoragegatewayRetrieveTapeArchiveInput *)request
     completionHandler:(void (^)(AWSstoragegatewayRetrieveTapeArchiveOutput *response, NSError *error))completionHandler {
    [[self retrieveTapeArchive:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayRetrieveTapeArchiveOutput *> * _Nonnull task) {
        AWSstoragegatewayRetrieveTapeArchiveOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayRetrieveTapeRecoveryPointOutput *> *)retrieveTapeRecoveryPoint:(AWSstoragegatewayRetrieveTapeRecoveryPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"RetrieveTapeRecoveryPoint"
                   outputClass:[AWSstoragegatewayRetrieveTapeRecoveryPointOutput class]];
}

- (void)retrieveTapeRecoveryPoint:(AWSstoragegatewayRetrieveTapeRecoveryPointInput *)request
     completionHandler:(void (^)(AWSstoragegatewayRetrieveTapeRecoveryPointOutput *response, NSError *error))completionHandler {
    [[self retrieveTapeRecoveryPoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayRetrieveTapeRecoveryPointOutput *> * _Nonnull task) {
        AWSstoragegatewayRetrieveTapeRecoveryPointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewaySetLocalConsolePasswordOutput *> *)setLocalConsolePassword:(AWSstoragegatewaySetLocalConsolePasswordInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"SetLocalConsolePassword"
                   outputClass:[AWSstoragegatewaySetLocalConsolePasswordOutput class]];
}

- (void)setLocalConsolePassword:(AWSstoragegatewaySetLocalConsolePasswordInput *)request
     completionHandler:(void (^)(AWSstoragegatewaySetLocalConsolePasswordOutput *response, NSError *error))completionHandler {
    [[self setLocalConsolePassword:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewaySetLocalConsolePasswordOutput *> * _Nonnull task) {
        AWSstoragegatewaySetLocalConsolePasswordOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewaySetSMBGuestPasswordOutput *> *)setSMBGuestPassword:(AWSstoragegatewaySetSMBGuestPasswordInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"SetSMBGuestPassword"
                   outputClass:[AWSstoragegatewaySetSMBGuestPasswordOutput class]];
}

- (void)setSMBGuestPassword:(AWSstoragegatewaySetSMBGuestPasswordInput *)request
     completionHandler:(void (^)(AWSstoragegatewaySetSMBGuestPasswordOutput *response, NSError *error))completionHandler {
    [[self setSMBGuestPassword:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewaySetSMBGuestPasswordOutput *> * _Nonnull task) {
        AWSstoragegatewaySetSMBGuestPasswordOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayShutdownGatewayOutput *> *)shutdownGateway:(AWSstoragegatewayShutdownGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ShutdownGateway"
                   outputClass:[AWSstoragegatewayShutdownGatewayOutput class]];
}

- (void)shutdownGateway:(AWSstoragegatewayShutdownGatewayInput *)request
     completionHandler:(void (^)(AWSstoragegatewayShutdownGatewayOutput *response, NSError *error))completionHandler {
    [[self shutdownGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayShutdownGatewayOutput *> * _Nonnull task) {
        AWSstoragegatewayShutdownGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayStartAvailabilityMonitorTestOutput *> *)startAvailabilityMonitorTest:(AWSstoragegatewayStartAvailabilityMonitorTestInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"StartAvailabilityMonitorTest"
                   outputClass:[AWSstoragegatewayStartAvailabilityMonitorTestOutput class]];
}

- (void)startAvailabilityMonitorTest:(AWSstoragegatewayStartAvailabilityMonitorTestInput *)request
     completionHandler:(void (^)(AWSstoragegatewayStartAvailabilityMonitorTestOutput *response, NSError *error))completionHandler {
    [[self startAvailabilityMonitorTest:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayStartAvailabilityMonitorTestOutput *> * _Nonnull task) {
        AWSstoragegatewayStartAvailabilityMonitorTestOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayStartGatewayOutput *> *)startGateway:(AWSstoragegatewayStartGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"StartGateway"
                   outputClass:[AWSstoragegatewayStartGatewayOutput class]];
}

- (void)startGateway:(AWSstoragegatewayStartGatewayInput *)request
     completionHandler:(void (^)(AWSstoragegatewayStartGatewayOutput *response, NSError *error))completionHandler {
    [[self startGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayStartGatewayOutput *> * _Nonnull task) {
        AWSstoragegatewayStartGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput *> *)updateAutomaticTapeCreationPolicy:(AWSstoragegatewayUpdateAutomaticTapeCreationPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateAutomaticTapeCreationPolicy"
                   outputClass:[AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput class]];
}

- (void)updateAutomaticTapeCreationPolicy:(AWSstoragegatewayUpdateAutomaticTapeCreationPolicyInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput *response, NSError *error))completionHandler {
    [[self updateAutomaticTapeCreationPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateBandwidthRateLimitOutput *> *)updateBandwidthRateLimit:(AWSstoragegatewayUpdateBandwidthRateLimitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateBandwidthRateLimit"
                   outputClass:[AWSstoragegatewayUpdateBandwidthRateLimitOutput class]];
}

- (void)updateBandwidthRateLimit:(AWSstoragegatewayUpdateBandwidthRateLimitInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateBandwidthRateLimitOutput *response, NSError *error))completionHandler {
    [[self updateBandwidthRateLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateBandwidthRateLimitOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateBandwidthRateLimitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateChapCredentialsOutput *> *)updateChapCredentials:(AWSstoragegatewayUpdateChapCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateChapCredentials"
                   outputClass:[AWSstoragegatewayUpdateChapCredentialsOutput class]];
}

- (void)updateChapCredentials:(AWSstoragegatewayUpdateChapCredentialsInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateChapCredentialsOutput *response, NSError *error))completionHandler {
    [[self updateChapCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateChapCredentialsOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateChapCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateGatewayInformationOutput *> *)updateGatewayInformation:(AWSstoragegatewayUpdateGatewayInformationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateGatewayInformation"
                   outputClass:[AWSstoragegatewayUpdateGatewayInformationOutput class]];
}

- (void)updateGatewayInformation:(AWSstoragegatewayUpdateGatewayInformationInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateGatewayInformationOutput *response, NSError *error))completionHandler {
    [[self updateGatewayInformation:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateGatewayInformationOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateGatewayInformationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateGatewaySoftwareNowOutput *> *)updateGatewaySoftwareNow:(AWSstoragegatewayUpdateGatewaySoftwareNowInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateGatewaySoftwareNow"
                   outputClass:[AWSstoragegatewayUpdateGatewaySoftwareNowOutput class]];
}

- (void)updateGatewaySoftwareNow:(AWSstoragegatewayUpdateGatewaySoftwareNowInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateGatewaySoftwareNowOutput *response, NSError *error))completionHandler {
    [[self updateGatewaySoftwareNow:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateGatewaySoftwareNowOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateGatewaySoftwareNowOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateMaintenanceStartTimeOutput *> *)updateMaintenanceStartTime:(AWSstoragegatewayUpdateMaintenanceStartTimeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateMaintenanceStartTime"
                   outputClass:[AWSstoragegatewayUpdateMaintenanceStartTimeOutput class]];
}

- (void)updateMaintenanceStartTime:(AWSstoragegatewayUpdateMaintenanceStartTimeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateMaintenanceStartTimeOutput *response, NSError *error))completionHandler {
    [[self updateMaintenanceStartTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateMaintenanceStartTimeOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateMaintenanceStartTimeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateNFSFileShareOutput *> *)updateNFSFileShare:(AWSstoragegatewayUpdateNFSFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateNFSFileShare"
                   outputClass:[AWSstoragegatewayUpdateNFSFileShareOutput class]];
}

- (void)updateNFSFileShare:(AWSstoragegatewayUpdateNFSFileShareInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateNFSFileShareOutput *response, NSError *error))completionHandler {
    [[self updateNFSFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateNFSFileShareOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateNFSFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateSMBFileShareOutput *> *)updateSMBFileShare:(AWSstoragegatewayUpdateSMBFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateSMBFileShare"
                   outputClass:[AWSstoragegatewayUpdateSMBFileShareOutput class]];
}

- (void)updateSMBFileShare:(AWSstoragegatewayUpdateSMBFileShareInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateSMBFileShareOutput *response, NSError *error))completionHandler {
    [[self updateSMBFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateSMBFileShareOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateSMBFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateSMBSecurityStrategyOutput *> *)updateSMBSecurityStrategy:(AWSstoragegatewayUpdateSMBSecurityStrategyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateSMBSecurityStrategy"
                   outputClass:[AWSstoragegatewayUpdateSMBSecurityStrategyOutput class]];
}

- (void)updateSMBSecurityStrategy:(AWSstoragegatewayUpdateSMBSecurityStrategyInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateSMBSecurityStrategyOutput *response, NSError *error))completionHandler {
    [[self updateSMBSecurityStrategy:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateSMBSecurityStrategyOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateSMBSecurityStrategyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateSnapshotScheduleOutput *> *)updateSnapshotSchedule:(AWSstoragegatewayUpdateSnapshotScheduleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateSnapshotSchedule"
                   outputClass:[AWSstoragegatewayUpdateSnapshotScheduleOutput class]];
}

- (void)updateSnapshotSchedule:(AWSstoragegatewayUpdateSnapshotScheduleInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateSnapshotScheduleOutput *response, NSError *error))completionHandler {
    [[self updateSnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateSnapshotScheduleOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateSnapshotScheduleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSstoragegatewayUpdateVTLDeviceTypeOutput *> *)updateVTLDeviceType:(AWSstoragegatewayUpdateVTLDeviceTypeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateVTLDeviceType"
                   outputClass:[AWSstoragegatewayUpdateVTLDeviceTypeOutput class]];
}

- (void)updateVTLDeviceType:(AWSstoragegatewayUpdateVTLDeviceTypeInput *)request
     completionHandler:(void (^)(AWSstoragegatewayUpdateVTLDeviceTypeOutput *response, NSError *error))completionHandler {
    [[self updateVTLDeviceType:request] continueWithBlock:^id _Nullable(AWSTask<AWSstoragegatewayUpdateVTLDeviceTypeOutput *> * _Nonnull task) {
        AWSstoragegatewayUpdateVTLDeviceTypeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
