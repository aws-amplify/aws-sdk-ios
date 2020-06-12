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

#import "AWSStoragegatewayService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSStoragegatewayResources.h"

static NSString *const AWSInfoStoragegateway = @"Storagegateway";
NSString *const AWSStoragegatewaySDKVersion = @"2.13.4";


@interface AWSStoragegatewayResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSStoragegatewayResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalServerError" : @(AWSStoragegatewayErrorInternalServer),
                            @"InvalidGatewayRequestException" : @(AWSStoragegatewayErrorInvalidGatewayRequest),
                            @"ServiceUnavailableError" : @(AWSStoragegatewayErrorServiceUnavailable),
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
	                *error = [NSError errorWithDomain:AWSStoragegatewayErrorDomain
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
        *error = [NSError errorWithDomain:AWSStoragegatewayErrorDomain
                                     code:AWSStoragegatewayErrorUnknown
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

@interface AWSStoragegatewayRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSStoragegatewayRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSStoragegateway()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSStoragegateway

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSStoragegatewaySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSStoragegateway versions need to match. Check your SDK installation. AWSCore: %@ AWSStoragegateway: %@", AWSiOSSDKVersion, AWSStoragegatewaySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultStoragegateway {
    static AWSStoragegateway *_defaultStoragegateway = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoStoragegateway];
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
        _defaultStoragegateway = [[AWSStoragegateway alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultStoragegateway;
}

+ (void)registerStoragegatewayWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSStoragegateway alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)StoragegatewayForKey:(NSString *)key {
    @synchronized(self) {
        AWSStoragegateway *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoStoragegateway
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSStoragegateway registerStoragegatewayWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeStoragegatewayForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultStoragegateway` or `+ StoragegatewayForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceStoragegateway
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceStoragegateway];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSStoragegatewayRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSStoragegatewayResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSStoragegatewayResponseSerializer alloc] initWithJSONDefinition:[[AWSStoragegatewayResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSStoragegatewayActivateGatewayOutput *> *)activateGateway:(AWSStoragegatewayActivateGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ActivateGateway"
                   outputClass:[AWSStoragegatewayActivateGatewayOutput class]];
}

- (void)activateGateway:(AWSStoragegatewayActivateGatewayInput *)request
     completionHandler:(void (^)(AWSStoragegatewayActivateGatewayOutput *response, NSError *error))completionHandler {
    [[self activateGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayActivateGatewayOutput *> * _Nonnull task) {
        AWSStoragegatewayActivateGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayAddCacheOutput *> *)addCache:(AWSStoragegatewayAddCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AddCache"
                   outputClass:[AWSStoragegatewayAddCacheOutput class]];
}

- (void)addCache:(AWSStoragegatewayAddCacheInput *)request
     completionHandler:(void (^)(AWSStoragegatewayAddCacheOutput *response, NSError *error))completionHandler {
    [[self addCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayAddCacheOutput *> * _Nonnull task) {
        AWSStoragegatewayAddCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayAddTagsToResourceOutput *> *)addTagsToResource:(AWSStoragegatewayAddTagsToResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AddTagsToResource"
                   outputClass:[AWSStoragegatewayAddTagsToResourceOutput class]];
}

- (void)addTagsToResource:(AWSStoragegatewayAddTagsToResourceInput *)request
     completionHandler:(void (^)(AWSStoragegatewayAddTagsToResourceOutput *response, NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayAddTagsToResourceOutput *> * _Nonnull task) {
        AWSStoragegatewayAddTagsToResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayAddUploadBufferOutput *> *)addUploadBuffer:(AWSStoragegatewayAddUploadBufferInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AddUploadBuffer"
                   outputClass:[AWSStoragegatewayAddUploadBufferOutput class]];
}

- (void)addUploadBuffer:(AWSStoragegatewayAddUploadBufferInput *)request
     completionHandler:(void (^)(AWSStoragegatewayAddUploadBufferOutput *response, NSError *error))completionHandler {
    [[self addUploadBuffer:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayAddUploadBufferOutput *> * _Nonnull task) {
        AWSStoragegatewayAddUploadBufferOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayAddWorkingStorageOutput *> *)addWorkingStorage:(AWSStoragegatewayAddWorkingStorageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AddWorkingStorage"
                   outputClass:[AWSStoragegatewayAddWorkingStorageOutput class]];
}

- (void)addWorkingStorage:(AWSStoragegatewayAddWorkingStorageInput *)request
     completionHandler:(void (^)(AWSStoragegatewayAddWorkingStorageOutput *response, NSError *error))completionHandler {
    [[self addWorkingStorage:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayAddWorkingStorageOutput *> * _Nonnull task) {
        AWSStoragegatewayAddWorkingStorageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayAssignTapePoolOutput *> *)assignTapePool:(AWSStoragegatewayAssignTapePoolInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AssignTapePool"
                   outputClass:[AWSStoragegatewayAssignTapePoolOutput class]];
}

- (void)assignTapePool:(AWSStoragegatewayAssignTapePoolInput *)request
     completionHandler:(void (^)(AWSStoragegatewayAssignTapePoolOutput *response, NSError *error))completionHandler {
    [[self assignTapePool:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayAssignTapePoolOutput *> * _Nonnull task) {
        AWSStoragegatewayAssignTapePoolOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayAttachVolumeOutput *> *)attachVolume:(AWSStoragegatewayAttachVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"AttachVolume"
                   outputClass:[AWSStoragegatewayAttachVolumeOutput class]];
}

- (void)attachVolume:(AWSStoragegatewayAttachVolumeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayAttachVolumeOutput *response, NSError *error))completionHandler {
    [[self attachVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayAttachVolumeOutput *> * _Nonnull task) {
        AWSStoragegatewayAttachVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCancelArchivalOutput *> *)cancelArchival:(AWSStoragegatewayCancelArchivalInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CancelArchival"
                   outputClass:[AWSStoragegatewayCancelArchivalOutput class]];
}

- (void)cancelArchival:(AWSStoragegatewayCancelArchivalInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCancelArchivalOutput *response, NSError *error))completionHandler {
    [[self cancelArchival:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCancelArchivalOutput *> * _Nonnull task) {
        AWSStoragegatewayCancelArchivalOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCancelRetrievalOutput *> *)cancelRetrieval:(AWSStoragegatewayCancelRetrievalInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CancelRetrieval"
                   outputClass:[AWSStoragegatewayCancelRetrievalOutput class]];
}

- (void)cancelRetrieval:(AWSStoragegatewayCancelRetrievalInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCancelRetrievalOutput *response, NSError *error))completionHandler {
    [[self cancelRetrieval:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCancelRetrievalOutput *> * _Nonnull task) {
        AWSStoragegatewayCancelRetrievalOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCreateCachediSCSIVolumeOutput *> *)createCachediSCSIVolume:(AWSStoragegatewayCreateCachediSCSIVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateCachediSCSIVolume"
                   outputClass:[AWSStoragegatewayCreateCachediSCSIVolumeOutput class]];
}

- (void)createCachediSCSIVolume:(AWSStoragegatewayCreateCachediSCSIVolumeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCreateCachediSCSIVolumeOutput *response, NSError *error))completionHandler {
    [[self createCachediSCSIVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCreateCachediSCSIVolumeOutput *> * _Nonnull task) {
        AWSStoragegatewayCreateCachediSCSIVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCreateNFSFileShareOutput *> *)createNFSFileShare:(AWSStoragegatewayCreateNFSFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateNFSFileShare"
                   outputClass:[AWSStoragegatewayCreateNFSFileShareOutput class]];
}

- (void)createNFSFileShare:(AWSStoragegatewayCreateNFSFileShareInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCreateNFSFileShareOutput *response, NSError *error))completionHandler {
    [[self createNFSFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCreateNFSFileShareOutput *> * _Nonnull task) {
        AWSStoragegatewayCreateNFSFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCreateSMBFileShareOutput *> *)createSMBFileShare:(AWSStoragegatewayCreateSMBFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateSMBFileShare"
                   outputClass:[AWSStoragegatewayCreateSMBFileShareOutput class]];
}

- (void)createSMBFileShare:(AWSStoragegatewayCreateSMBFileShareInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCreateSMBFileShareOutput *response, NSError *error))completionHandler {
    [[self createSMBFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCreateSMBFileShareOutput *> * _Nonnull task) {
        AWSStoragegatewayCreateSMBFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCreateSnapshotOutput *> *)createSnapshot:(AWSStoragegatewayCreateSnapshotInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateSnapshot"
                   outputClass:[AWSStoragegatewayCreateSnapshotOutput class]];
}

- (void)createSnapshot:(AWSStoragegatewayCreateSnapshotInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCreateSnapshotOutput *response, NSError *error))completionHandler {
    [[self createSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCreateSnapshotOutput *> * _Nonnull task) {
        AWSStoragegatewayCreateSnapshotOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *> *)createSnapshotFromVolumeRecoveryPoint:(AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateSnapshotFromVolumeRecoveryPoint"
                   outputClass:[AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput class]];
}

- (void)createSnapshotFromVolumeRecoveryPoint:(AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *response, NSError *error))completionHandler {
    [[self createSnapshotFromVolumeRecoveryPoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *> * _Nonnull task) {
        AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCreateStorediSCSIVolumeOutput *> *)createStorediSCSIVolume:(AWSStoragegatewayCreateStorediSCSIVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateStorediSCSIVolume"
                   outputClass:[AWSStoragegatewayCreateStorediSCSIVolumeOutput class]];
}

- (void)createStorediSCSIVolume:(AWSStoragegatewayCreateStorediSCSIVolumeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCreateStorediSCSIVolumeOutput *response, NSError *error))completionHandler {
    [[self createStorediSCSIVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCreateStorediSCSIVolumeOutput *> * _Nonnull task) {
        AWSStoragegatewayCreateStorediSCSIVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCreateTapeWithBarcodeOutput *> *)createTapeWithBarcode:(AWSStoragegatewayCreateTapeWithBarcodeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateTapeWithBarcode"
                   outputClass:[AWSStoragegatewayCreateTapeWithBarcodeOutput class]];
}

- (void)createTapeWithBarcode:(AWSStoragegatewayCreateTapeWithBarcodeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCreateTapeWithBarcodeOutput *response, NSError *error))completionHandler {
    [[self createTapeWithBarcode:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCreateTapeWithBarcodeOutput *> * _Nonnull task) {
        AWSStoragegatewayCreateTapeWithBarcodeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayCreateTapesOutput *> *)createTapes:(AWSStoragegatewayCreateTapesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"CreateTapes"
                   outputClass:[AWSStoragegatewayCreateTapesOutput class]];
}

- (void)createTapes:(AWSStoragegatewayCreateTapesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayCreateTapesOutput *response, NSError *error))completionHandler {
    [[self createTapes:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayCreateTapesOutput *> * _Nonnull task) {
        AWSStoragegatewayCreateTapesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput *> *)deleteAutomaticTapeCreationPolicy:(AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteAutomaticTapeCreationPolicy"
                   outputClass:[AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput class]];
}

- (void)deleteAutomaticTapeCreationPolicy:(AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput *response, NSError *error))completionHandler {
    [[self deleteAutomaticTapeCreationPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput *> * _Nonnull task) {
        AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDeleteBandwidthRateLimitOutput *> *)deleteBandwidthRateLimit:(AWSStoragegatewayDeleteBandwidthRateLimitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteBandwidthRateLimit"
                   outputClass:[AWSStoragegatewayDeleteBandwidthRateLimitOutput class]];
}

- (void)deleteBandwidthRateLimit:(AWSStoragegatewayDeleteBandwidthRateLimitInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDeleteBandwidthRateLimitOutput *response, NSError *error))completionHandler {
    [[self deleteBandwidthRateLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDeleteBandwidthRateLimitOutput *> * _Nonnull task) {
        AWSStoragegatewayDeleteBandwidthRateLimitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDeleteChapCredentialsOutput *> *)deleteChapCredentials:(AWSStoragegatewayDeleteChapCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteChapCredentials"
                   outputClass:[AWSStoragegatewayDeleteChapCredentialsOutput class]];
}

- (void)deleteChapCredentials:(AWSStoragegatewayDeleteChapCredentialsInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDeleteChapCredentialsOutput *response, NSError *error))completionHandler {
    [[self deleteChapCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDeleteChapCredentialsOutput *> * _Nonnull task) {
        AWSStoragegatewayDeleteChapCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDeleteFileShareOutput *> *)deleteFileShare:(AWSStoragegatewayDeleteFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteFileShare"
                   outputClass:[AWSStoragegatewayDeleteFileShareOutput class]];
}

- (void)deleteFileShare:(AWSStoragegatewayDeleteFileShareInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDeleteFileShareOutput *response, NSError *error))completionHandler {
    [[self deleteFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDeleteFileShareOutput *> * _Nonnull task) {
        AWSStoragegatewayDeleteFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDeleteGatewayOutput *> *)deleteGateway:(AWSStoragegatewayDeleteGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteGateway"
                   outputClass:[AWSStoragegatewayDeleteGatewayOutput class]];
}

- (void)deleteGateway:(AWSStoragegatewayDeleteGatewayInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDeleteGatewayOutput *response, NSError *error))completionHandler {
    [[self deleteGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDeleteGatewayOutput *> * _Nonnull task) {
        AWSStoragegatewayDeleteGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDeleteSnapshotScheduleOutput *> *)deleteSnapshotSchedule:(AWSStoragegatewayDeleteSnapshotScheduleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteSnapshotSchedule"
                   outputClass:[AWSStoragegatewayDeleteSnapshotScheduleOutput class]];
}

- (void)deleteSnapshotSchedule:(AWSStoragegatewayDeleteSnapshotScheduleInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDeleteSnapshotScheduleOutput *response, NSError *error))completionHandler {
    [[self deleteSnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDeleteSnapshotScheduleOutput *> * _Nonnull task) {
        AWSStoragegatewayDeleteSnapshotScheduleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDeleteTapeOutput *> *)deleteTape:(AWSStoragegatewayDeleteTapeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteTape"
                   outputClass:[AWSStoragegatewayDeleteTapeOutput class]];
}

- (void)deleteTape:(AWSStoragegatewayDeleteTapeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDeleteTapeOutput *response, NSError *error))completionHandler {
    [[self deleteTape:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDeleteTapeOutput *> * _Nonnull task) {
        AWSStoragegatewayDeleteTapeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDeleteTapeArchiveOutput *> *)deleteTapeArchive:(AWSStoragegatewayDeleteTapeArchiveInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteTapeArchive"
                   outputClass:[AWSStoragegatewayDeleteTapeArchiveOutput class]];
}

- (void)deleteTapeArchive:(AWSStoragegatewayDeleteTapeArchiveInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDeleteTapeArchiveOutput *response, NSError *error))completionHandler {
    [[self deleteTapeArchive:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDeleteTapeArchiveOutput *> * _Nonnull task) {
        AWSStoragegatewayDeleteTapeArchiveOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDeleteVolumeOutput *> *)deleteVolume:(AWSStoragegatewayDeleteVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DeleteVolume"
                   outputClass:[AWSStoragegatewayDeleteVolumeOutput class]];
}

- (void)deleteVolume:(AWSStoragegatewayDeleteVolumeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDeleteVolumeOutput *response, NSError *error))completionHandler {
    [[self deleteVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDeleteVolumeOutput *> * _Nonnull task) {
        AWSStoragegatewayDeleteVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeAvailabilityMonitorTestOutput *> *)describeAvailabilityMonitorTest:(AWSStoragegatewayDescribeAvailabilityMonitorTestInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeAvailabilityMonitorTest"
                   outputClass:[AWSStoragegatewayDescribeAvailabilityMonitorTestOutput class]];
}

- (void)describeAvailabilityMonitorTest:(AWSStoragegatewayDescribeAvailabilityMonitorTestInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeAvailabilityMonitorTestOutput *response, NSError *error))completionHandler {
    [[self describeAvailabilityMonitorTest:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeAvailabilityMonitorTestOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeAvailabilityMonitorTestOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeBandwidthRateLimitOutput *> *)describeBandwidthRateLimit:(AWSStoragegatewayDescribeBandwidthRateLimitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeBandwidthRateLimit"
                   outputClass:[AWSStoragegatewayDescribeBandwidthRateLimitOutput class]];
}

- (void)describeBandwidthRateLimit:(AWSStoragegatewayDescribeBandwidthRateLimitInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeBandwidthRateLimitOutput *response, NSError *error))completionHandler {
    [[self describeBandwidthRateLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeBandwidthRateLimitOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeBandwidthRateLimitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeCacheOutput *> *)describeCache:(AWSStoragegatewayDescribeCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeCache"
                   outputClass:[AWSStoragegatewayDescribeCacheOutput class]];
}

- (void)describeCache:(AWSStoragegatewayDescribeCacheInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeCacheOutput *response, NSError *error))completionHandler {
    [[self describeCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeCacheOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeCachediSCSIVolumesOutput *> *)describeCachediSCSIVolumes:(AWSStoragegatewayDescribeCachediSCSIVolumesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeCachediSCSIVolumes"
                   outputClass:[AWSStoragegatewayDescribeCachediSCSIVolumesOutput class]];
}

- (void)describeCachediSCSIVolumes:(AWSStoragegatewayDescribeCachediSCSIVolumesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeCachediSCSIVolumesOutput *response, NSError *error))completionHandler {
    [[self describeCachediSCSIVolumes:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeCachediSCSIVolumesOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeCachediSCSIVolumesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeChapCredentialsOutput *> *)describeChapCredentials:(AWSStoragegatewayDescribeChapCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeChapCredentials"
                   outputClass:[AWSStoragegatewayDescribeChapCredentialsOutput class]];
}

- (void)describeChapCredentials:(AWSStoragegatewayDescribeChapCredentialsInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeChapCredentialsOutput *response, NSError *error))completionHandler {
    [[self describeChapCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeChapCredentialsOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeChapCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeGatewayInformationOutput *> *)describeGatewayInformation:(AWSStoragegatewayDescribeGatewayInformationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeGatewayInformation"
                   outputClass:[AWSStoragegatewayDescribeGatewayInformationOutput class]];
}

- (void)describeGatewayInformation:(AWSStoragegatewayDescribeGatewayInformationInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeGatewayInformationOutput *response, NSError *error))completionHandler {
    [[self describeGatewayInformation:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeGatewayInformationOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeGatewayInformationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeMaintenanceStartTimeOutput *> *)describeMaintenanceStartTime:(AWSStoragegatewayDescribeMaintenanceStartTimeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeMaintenanceStartTime"
                   outputClass:[AWSStoragegatewayDescribeMaintenanceStartTimeOutput class]];
}

- (void)describeMaintenanceStartTime:(AWSStoragegatewayDescribeMaintenanceStartTimeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeMaintenanceStartTimeOutput *response, NSError *error))completionHandler {
    [[self describeMaintenanceStartTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeMaintenanceStartTimeOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeMaintenanceStartTimeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeNFSFileSharesOutput *> *)describeNFSFileShares:(AWSStoragegatewayDescribeNFSFileSharesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeNFSFileShares"
                   outputClass:[AWSStoragegatewayDescribeNFSFileSharesOutput class]];
}

- (void)describeNFSFileShares:(AWSStoragegatewayDescribeNFSFileSharesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeNFSFileSharesOutput *response, NSError *error))completionHandler {
    [[self describeNFSFileShares:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeNFSFileSharesOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeNFSFileSharesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeSMBFileSharesOutput *> *)describeSMBFileShares:(AWSStoragegatewayDescribeSMBFileSharesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeSMBFileShares"
                   outputClass:[AWSStoragegatewayDescribeSMBFileSharesOutput class]];
}

- (void)describeSMBFileShares:(AWSStoragegatewayDescribeSMBFileSharesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeSMBFileSharesOutput *response, NSError *error))completionHandler {
    [[self describeSMBFileShares:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeSMBFileSharesOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeSMBFileSharesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeSMBSettingsOutput *> *)describeSMBSettings:(AWSStoragegatewayDescribeSMBSettingsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeSMBSettings"
                   outputClass:[AWSStoragegatewayDescribeSMBSettingsOutput class]];
}

- (void)describeSMBSettings:(AWSStoragegatewayDescribeSMBSettingsInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeSMBSettingsOutput *response, NSError *error))completionHandler {
    [[self describeSMBSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeSMBSettingsOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeSMBSettingsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeSnapshotScheduleOutput *> *)describeSnapshotSchedule:(AWSStoragegatewayDescribeSnapshotScheduleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeSnapshotSchedule"
                   outputClass:[AWSStoragegatewayDescribeSnapshotScheduleOutput class]];
}

- (void)describeSnapshotSchedule:(AWSStoragegatewayDescribeSnapshotScheduleInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeSnapshotScheduleOutput *response, NSError *error))completionHandler {
    [[self describeSnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeSnapshotScheduleOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeSnapshotScheduleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeStorediSCSIVolumesOutput *> *)describeStorediSCSIVolumes:(AWSStoragegatewayDescribeStorediSCSIVolumesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeStorediSCSIVolumes"
                   outputClass:[AWSStoragegatewayDescribeStorediSCSIVolumesOutput class]];
}

- (void)describeStorediSCSIVolumes:(AWSStoragegatewayDescribeStorediSCSIVolumesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeStorediSCSIVolumesOutput *response, NSError *error))completionHandler {
    [[self describeStorediSCSIVolumes:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeStorediSCSIVolumesOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeStorediSCSIVolumesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeTapeArchivesOutput *> *)describeTapeArchives:(AWSStoragegatewayDescribeTapeArchivesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeTapeArchives"
                   outputClass:[AWSStoragegatewayDescribeTapeArchivesOutput class]];
}

- (void)describeTapeArchives:(AWSStoragegatewayDescribeTapeArchivesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeTapeArchivesOutput *response, NSError *error))completionHandler {
    [[self describeTapeArchives:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeTapeArchivesOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeTapeArchivesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeTapeRecoveryPointsOutput *> *)describeTapeRecoveryPoints:(AWSStoragegatewayDescribeTapeRecoveryPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeTapeRecoveryPoints"
                   outputClass:[AWSStoragegatewayDescribeTapeRecoveryPointsOutput class]];
}

- (void)describeTapeRecoveryPoints:(AWSStoragegatewayDescribeTapeRecoveryPointsInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeTapeRecoveryPointsOutput *response, NSError *error))completionHandler {
    [[self describeTapeRecoveryPoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeTapeRecoveryPointsOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeTapeRecoveryPointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeTapesOutput *> *)describeTapes:(AWSStoragegatewayDescribeTapesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeTapes"
                   outputClass:[AWSStoragegatewayDescribeTapesOutput class]];
}

- (void)describeTapes:(AWSStoragegatewayDescribeTapesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeTapesOutput *response, NSError *error))completionHandler {
    [[self describeTapes:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeTapesOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeTapesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeUploadBufferOutput *> *)describeUploadBuffer:(AWSStoragegatewayDescribeUploadBufferInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeUploadBuffer"
                   outputClass:[AWSStoragegatewayDescribeUploadBufferOutput class]];
}

- (void)describeUploadBuffer:(AWSStoragegatewayDescribeUploadBufferInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeUploadBufferOutput *response, NSError *error))completionHandler {
    [[self describeUploadBuffer:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeUploadBufferOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeUploadBufferOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeVTLDevicesOutput *> *)describeVTLDevices:(AWSStoragegatewayDescribeVTLDevicesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeVTLDevices"
                   outputClass:[AWSStoragegatewayDescribeVTLDevicesOutput class]];
}

- (void)describeVTLDevices:(AWSStoragegatewayDescribeVTLDevicesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeVTLDevicesOutput *response, NSError *error))completionHandler {
    [[self describeVTLDevices:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeVTLDevicesOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeVTLDevicesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDescribeWorkingStorageOutput *> *)describeWorkingStorage:(AWSStoragegatewayDescribeWorkingStorageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DescribeWorkingStorage"
                   outputClass:[AWSStoragegatewayDescribeWorkingStorageOutput class]];
}

- (void)describeWorkingStorage:(AWSStoragegatewayDescribeWorkingStorageInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDescribeWorkingStorageOutput *response, NSError *error))completionHandler {
    [[self describeWorkingStorage:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDescribeWorkingStorageOutput *> * _Nonnull task) {
        AWSStoragegatewayDescribeWorkingStorageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDetachVolumeOutput *> *)detachVolume:(AWSStoragegatewayDetachVolumeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DetachVolume"
                   outputClass:[AWSStoragegatewayDetachVolumeOutput class]];
}

- (void)detachVolume:(AWSStoragegatewayDetachVolumeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDetachVolumeOutput *response, NSError *error))completionHandler {
    [[self detachVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDetachVolumeOutput *> * _Nonnull task) {
        AWSStoragegatewayDetachVolumeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayDisableGatewayOutput *> *)disableGateway:(AWSStoragegatewayDisableGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"DisableGateway"
                   outputClass:[AWSStoragegatewayDisableGatewayOutput class]];
}

- (void)disableGateway:(AWSStoragegatewayDisableGatewayInput *)request
     completionHandler:(void (^)(AWSStoragegatewayDisableGatewayOutput *response, NSError *error))completionHandler {
    [[self disableGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayDisableGatewayOutput *> * _Nonnull task) {
        AWSStoragegatewayDisableGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayJoinDomainOutput *> *)joinDomain:(AWSStoragegatewayJoinDomainInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"JoinDomain"
                   outputClass:[AWSStoragegatewayJoinDomainOutput class]];
}

- (void)joinDomain:(AWSStoragegatewayJoinDomainInput *)request
     completionHandler:(void (^)(AWSStoragegatewayJoinDomainOutput *response, NSError *error))completionHandler {
    [[self joinDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayJoinDomainOutput *> * _Nonnull task) {
        AWSStoragegatewayJoinDomainOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput *> *)listAutomaticTapeCreationPolicies:(AWSStoragegatewayListAutomaticTapeCreationPoliciesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListAutomaticTapeCreationPolicies"
                   outputClass:[AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput class]];
}

- (void)listAutomaticTapeCreationPolicies:(AWSStoragegatewayListAutomaticTapeCreationPoliciesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput *response, NSError *error))completionHandler {
    [[self listAutomaticTapeCreationPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput *> * _Nonnull task) {
        AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayListFileSharesOutput *> *)listFileShares:(AWSStoragegatewayListFileSharesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListFileShares"
                   outputClass:[AWSStoragegatewayListFileSharesOutput class]];
}

- (void)listFileShares:(AWSStoragegatewayListFileSharesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayListFileSharesOutput *response, NSError *error))completionHandler {
    [[self listFileShares:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayListFileSharesOutput *> * _Nonnull task) {
        AWSStoragegatewayListFileSharesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayListGatewaysOutput *> *)listGateways:(AWSStoragegatewayListGatewaysInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListGateways"
                   outputClass:[AWSStoragegatewayListGatewaysOutput class]];
}

- (void)listGateways:(AWSStoragegatewayListGatewaysInput *)request
     completionHandler:(void (^)(AWSStoragegatewayListGatewaysOutput *response, NSError *error))completionHandler {
    [[self listGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayListGatewaysOutput *> * _Nonnull task) {
        AWSStoragegatewayListGatewaysOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayListLocalDisksOutput *> *)listLocalDisks:(AWSStoragegatewayListLocalDisksInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListLocalDisks"
                   outputClass:[AWSStoragegatewayListLocalDisksOutput class]];
}

- (void)listLocalDisks:(AWSStoragegatewayListLocalDisksInput *)request
     completionHandler:(void (^)(AWSStoragegatewayListLocalDisksOutput *response, NSError *error))completionHandler {
    [[self listLocalDisks:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayListLocalDisksOutput *> * _Nonnull task) {
        AWSStoragegatewayListLocalDisksOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayListTagsForResourceOutput *> *)listTagsForResource:(AWSStoragegatewayListTagsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSStoragegatewayListTagsForResourceOutput class]];
}

- (void)listTagsForResource:(AWSStoragegatewayListTagsForResourceInput *)request
     completionHandler:(void (^)(AWSStoragegatewayListTagsForResourceOutput *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayListTagsForResourceOutput *> * _Nonnull task) {
        AWSStoragegatewayListTagsForResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayListTapesOutput *> *)listTapes:(AWSStoragegatewayListTapesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListTapes"
                   outputClass:[AWSStoragegatewayListTapesOutput class]];
}

- (void)listTapes:(AWSStoragegatewayListTapesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayListTapesOutput *response, NSError *error))completionHandler {
    [[self listTapes:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayListTapesOutput *> * _Nonnull task) {
        AWSStoragegatewayListTapesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayListVolumeInitiatorsOutput *> *)listVolumeInitiators:(AWSStoragegatewayListVolumeInitiatorsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListVolumeInitiators"
                   outputClass:[AWSStoragegatewayListVolumeInitiatorsOutput class]];
}

- (void)listVolumeInitiators:(AWSStoragegatewayListVolumeInitiatorsInput *)request
     completionHandler:(void (^)(AWSStoragegatewayListVolumeInitiatorsOutput *response, NSError *error))completionHandler {
    [[self listVolumeInitiators:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayListVolumeInitiatorsOutput *> * _Nonnull task) {
        AWSStoragegatewayListVolumeInitiatorsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayListVolumeRecoveryPointsOutput *> *)listVolumeRecoveryPoints:(AWSStoragegatewayListVolumeRecoveryPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListVolumeRecoveryPoints"
                   outputClass:[AWSStoragegatewayListVolumeRecoveryPointsOutput class]];
}

- (void)listVolumeRecoveryPoints:(AWSStoragegatewayListVolumeRecoveryPointsInput *)request
     completionHandler:(void (^)(AWSStoragegatewayListVolumeRecoveryPointsOutput *response, NSError *error))completionHandler {
    [[self listVolumeRecoveryPoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayListVolumeRecoveryPointsOutput *> * _Nonnull task) {
        AWSStoragegatewayListVolumeRecoveryPointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayListVolumesOutput *> *)listVolumes:(AWSStoragegatewayListVolumesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ListVolumes"
                   outputClass:[AWSStoragegatewayListVolumesOutput class]];
}

- (void)listVolumes:(AWSStoragegatewayListVolumesInput *)request
     completionHandler:(void (^)(AWSStoragegatewayListVolumesOutput *response, NSError *error))completionHandler {
    [[self listVolumes:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayListVolumesOutput *> * _Nonnull task) {
        AWSStoragegatewayListVolumesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayNotifyWhenUploadedOutput *> *)notifyWhenUploaded:(AWSStoragegatewayNotifyWhenUploadedInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"NotifyWhenUploaded"
                   outputClass:[AWSStoragegatewayNotifyWhenUploadedOutput class]];
}

- (void)notifyWhenUploaded:(AWSStoragegatewayNotifyWhenUploadedInput *)request
     completionHandler:(void (^)(AWSStoragegatewayNotifyWhenUploadedOutput *response, NSError *error))completionHandler {
    [[self notifyWhenUploaded:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayNotifyWhenUploadedOutput *> * _Nonnull task) {
        AWSStoragegatewayNotifyWhenUploadedOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayRefreshCacheOutput *> *)refreshCache:(AWSStoragegatewayRefreshCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"RefreshCache"
                   outputClass:[AWSStoragegatewayRefreshCacheOutput class]];
}

- (void)refreshCache:(AWSStoragegatewayRefreshCacheInput *)request
     completionHandler:(void (^)(AWSStoragegatewayRefreshCacheOutput *response, NSError *error))completionHandler {
    [[self refreshCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayRefreshCacheOutput *> * _Nonnull task) {
        AWSStoragegatewayRefreshCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayRemoveTagsFromResourceOutput *> *)removeTagsFromResource:(AWSStoragegatewayRemoveTagsFromResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"RemoveTagsFromResource"
                   outputClass:[AWSStoragegatewayRemoveTagsFromResourceOutput class]];
}

- (void)removeTagsFromResource:(AWSStoragegatewayRemoveTagsFromResourceInput *)request
     completionHandler:(void (^)(AWSStoragegatewayRemoveTagsFromResourceOutput *response, NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayRemoveTagsFromResourceOutput *> * _Nonnull task) {
        AWSStoragegatewayRemoveTagsFromResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayResetCacheOutput *> *)resetCache:(AWSStoragegatewayResetCacheInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ResetCache"
                   outputClass:[AWSStoragegatewayResetCacheOutput class]];
}

- (void)resetCache:(AWSStoragegatewayResetCacheInput *)request
     completionHandler:(void (^)(AWSStoragegatewayResetCacheOutput *response, NSError *error))completionHandler {
    [[self resetCache:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayResetCacheOutput *> * _Nonnull task) {
        AWSStoragegatewayResetCacheOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayRetrieveTapeArchiveOutput *> *)retrieveTapeArchive:(AWSStoragegatewayRetrieveTapeArchiveInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"RetrieveTapeArchive"
                   outputClass:[AWSStoragegatewayRetrieveTapeArchiveOutput class]];
}

- (void)retrieveTapeArchive:(AWSStoragegatewayRetrieveTapeArchiveInput *)request
     completionHandler:(void (^)(AWSStoragegatewayRetrieveTapeArchiveOutput *response, NSError *error))completionHandler {
    [[self retrieveTapeArchive:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayRetrieveTapeArchiveOutput *> * _Nonnull task) {
        AWSStoragegatewayRetrieveTapeArchiveOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayRetrieveTapeRecoveryPointOutput *> *)retrieveTapeRecoveryPoint:(AWSStoragegatewayRetrieveTapeRecoveryPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"RetrieveTapeRecoveryPoint"
                   outputClass:[AWSStoragegatewayRetrieveTapeRecoveryPointOutput class]];
}

- (void)retrieveTapeRecoveryPoint:(AWSStoragegatewayRetrieveTapeRecoveryPointInput *)request
     completionHandler:(void (^)(AWSStoragegatewayRetrieveTapeRecoveryPointOutput *response, NSError *error))completionHandler {
    [[self retrieveTapeRecoveryPoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayRetrieveTapeRecoveryPointOutput *> * _Nonnull task) {
        AWSStoragegatewayRetrieveTapeRecoveryPointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewaySetLocalConsolePasswordOutput *> *)setLocalConsolePassword:(AWSStoragegatewaySetLocalConsolePasswordInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"SetLocalConsolePassword"
                   outputClass:[AWSStoragegatewaySetLocalConsolePasswordOutput class]];
}

- (void)setLocalConsolePassword:(AWSStoragegatewaySetLocalConsolePasswordInput *)request
     completionHandler:(void (^)(AWSStoragegatewaySetLocalConsolePasswordOutput *response, NSError *error))completionHandler {
    [[self setLocalConsolePassword:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewaySetLocalConsolePasswordOutput *> * _Nonnull task) {
        AWSStoragegatewaySetLocalConsolePasswordOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewaySetSMBGuestPasswordOutput *> *)setSMBGuestPassword:(AWSStoragegatewaySetSMBGuestPasswordInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"SetSMBGuestPassword"
                   outputClass:[AWSStoragegatewaySetSMBGuestPasswordOutput class]];
}

- (void)setSMBGuestPassword:(AWSStoragegatewaySetSMBGuestPasswordInput *)request
     completionHandler:(void (^)(AWSStoragegatewaySetSMBGuestPasswordOutput *response, NSError *error))completionHandler {
    [[self setSMBGuestPassword:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewaySetSMBGuestPasswordOutput *> * _Nonnull task) {
        AWSStoragegatewaySetSMBGuestPasswordOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayShutdownGatewayOutput *> *)shutdownGateway:(AWSStoragegatewayShutdownGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"ShutdownGateway"
                   outputClass:[AWSStoragegatewayShutdownGatewayOutput class]];
}

- (void)shutdownGateway:(AWSStoragegatewayShutdownGatewayInput *)request
     completionHandler:(void (^)(AWSStoragegatewayShutdownGatewayOutput *response, NSError *error))completionHandler {
    [[self shutdownGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayShutdownGatewayOutput *> * _Nonnull task) {
        AWSStoragegatewayShutdownGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayStartAvailabilityMonitorTestOutput *> *)startAvailabilityMonitorTest:(AWSStoragegatewayStartAvailabilityMonitorTestInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"StartAvailabilityMonitorTest"
                   outputClass:[AWSStoragegatewayStartAvailabilityMonitorTestOutput class]];
}

- (void)startAvailabilityMonitorTest:(AWSStoragegatewayStartAvailabilityMonitorTestInput *)request
     completionHandler:(void (^)(AWSStoragegatewayStartAvailabilityMonitorTestOutput *response, NSError *error))completionHandler {
    [[self startAvailabilityMonitorTest:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayStartAvailabilityMonitorTestOutput *> * _Nonnull task) {
        AWSStoragegatewayStartAvailabilityMonitorTestOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayStartGatewayOutput *> *)startGateway:(AWSStoragegatewayStartGatewayInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"StartGateway"
                   outputClass:[AWSStoragegatewayStartGatewayOutput class]];
}

- (void)startGateway:(AWSStoragegatewayStartGatewayInput *)request
     completionHandler:(void (^)(AWSStoragegatewayStartGatewayOutput *response, NSError *error))completionHandler {
    [[self startGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayStartGatewayOutput *> * _Nonnull task) {
        AWSStoragegatewayStartGatewayOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput *> *)updateAutomaticTapeCreationPolicy:(AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateAutomaticTapeCreationPolicy"
                   outputClass:[AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput class]];
}

- (void)updateAutomaticTapeCreationPolicy:(AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput *response, NSError *error))completionHandler {
    [[self updateAutomaticTapeCreationPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateBandwidthRateLimitOutput *> *)updateBandwidthRateLimit:(AWSStoragegatewayUpdateBandwidthRateLimitInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateBandwidthRateLimit"
                   outputClass:[AWSStoragegatewayUpdateBandwidthRateLimitOutput class]];
}

- (void)updateBandwidthRateLimit:(AWSStoragegatewayUpdateBandwidthRateLimitInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateBandwidthRateLimitOutput *response, NSError *error))completionHandler {
    [[self updateBandwidthRateLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateBandwidthRateLimitOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateBandwidthRateLimitOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateChapCredentialsOutput *> *)updateChapCredentials:(AWSStoragegatewayUpdateChapCredentialsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateChapCredentials"
                   outputClass:[AWSStoragegatewayUpdateChapCredentialsOutput class]];
}

- (void)updateChapCredentials:(AWSStoragegatewayUpdateChapCredentialsInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateChapCredentialsOutput *response, NSError *error))completionHandler {
    [[self updateChapCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateChapCredentialsOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateChapCredentialsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateGatewayInformationOutput *> *)updateGatewayInformation:(AWSStoragegatewayUpdateGatewayInformationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateGatewayInformation"
                   outputClass:[AWSStoragegatewayUpdateGatewayInformationOutput class]];
}

- (void)updateGatewayInformation:(AWSStoragegatewayUpdateGatewayInformationInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateGatewayInformationOutput *response, NSError *error))completionHandler {
    [[self updateGatewayInformation:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateGatewayInformationOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateGatewayInformationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateGatewaySoftwareNowOutput *> *)updateGatewaySoftwareNow:(AWSStoragegatewayUpdateGatewaySoftwareNowInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateGatewaySoftwareNow"
                   outputClass:[AWSStoragegatewayUpdateGatewaySoftwareNowOutput class]];
}

- (void)updateGatewaySoftwareNow:(AWSStoragegatewayUpdateGatewaySoftwareNowInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateGatewaySoftwareNowOutput *response, NSError *error))completionHandler {
    [[self updateGatewaySoftwareNow:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateGatewaySoftwareNowOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateGatewaySoftwareNowOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateMaintenanceStartTimeOutput *> *)updateMaintenanceStartTime:(AWSStoragegatewayUpdateMaintenanceStartTimeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateMaintenanceStartTime"
                   outputClass:[AWSStoragegatewayUpdateMaintenanceStartTimeOutput class]];
}

- (void)updateMaintenanceStartTime:(AWSStoragegatewayUpdateMaintenanceStartTimeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateMaintenanceStartTimeOutput *response, NSError *error))completionHandler {
    [[self updateMaintenanceStartTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateMaintenanceStartTimeOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateMaintenanceStartTimeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateNFSFileShareOutput *> *)updateNFSFileShare:(AWSStoragegatewayUpdateNFSFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateNFSFileShare"
                   outputClass:[AWSStoragegatewayUpdateNFSFileShareOutput class]];
}

- (void)updateNFSFileShare:(AWSStoragegatewayUpdateNFSFileShareInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateNFSFileShareOutput *response, NSError *error))completionHandler {
    [[self updateNFSFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateNFSFileShareOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateNFSFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateSMBFileShareOutput *> *)updateSMBFileShare:(AWSStoragegatewayUpdateSMBFileShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateSMBFileShare"
                   outputClass:[AWSStoragegatewayUpdateSMBFileShareOutput class]];
}

- (void)updateSMBFileShare:(AWSStoragegatewayUpdateSMBFileShareInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateSMBFileShareOutput *response, NSError *error))completionHandler {
    [[self updateSMBFileShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateSMBFileShareOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateSMBFileShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateSMBSecurityStrategyOutput *> *)updateSMBSecurityStrategy:(AWSStoragegatewayUpdateSMBSecurityStrategyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateSMBSecurityStrategy"
                   outputClass:[AWSStoragegatewayUpdateSMBSecurityStrategyOutput class]];
}

- (void)updateSMBSecurityStrategy:(AWSStoragegatewayUpdateSMBSecurityStrategyInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateSMBSecurityStrategyOutput *response, NSError *error))completionHandler {
    [[self updateSMBSecurityStrategy:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateSMBSecurityStrategyOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateSMBSecurityStrategyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateSnapshotScheduleOutput *> *)updateSnapshotSchedule:(AWSStoragegatewayUpdateSnapshotScheduleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateSnapshotSchedule"
                   outputClass:[AWSStoragegatewayUpdateSnapshotScheduleOutput class]];
}

- (void)updateSnapshotSchedule:(AWSStoragegatewayUpdateSnapshotScheduleInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateSnapshotScheduleOutput *response, NSError *error))completionHandler {
    [[self updateSnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateSnapshotScheduleOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateSnapshotScheduleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSStoragegatewayUpdateVTLDeviceTypeOutput *> *)updateVTLDeviceType:(AWSStoragegatewayUpdateVTLDeviceTypeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"StorageGateway_20130630"
                 operationName:@"UpdateVTLDeviceType"
                   outputClass:[AWSStoragegatewayUpdateVTLDeviceTypeOutput class]];
}

- (void)updateVTLDeviceType:(AWSStoragegatewayUpdateVTLDeviceTypeInput *)request
     completionHandler:(void (^)(AWSStoragegatewayUpdateVTLDeviceTypeOutput *response, NSError *error))completionHandler {
    [[self updateVTLDeviceType:request] continueWithBlock:^id _Nullable(AWSTask<AWSStoragegatewayUpdateVTLDeviceTypeOutput *> * _Nonnull task) {
        AWSStoragegatewayUpdateVTLDeviceTypeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
