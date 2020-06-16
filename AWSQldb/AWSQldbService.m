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

#import "AWSQldbService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSQldbResources.h"

static NSString *const AWSInfoQldb = @"Qldb";
NSString *const AWSQldbSDKVersion = @"2.13.4";


@interface AWSQldbResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSQldbResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InvalidParameterException" : @(AWSQldbErrorInvalidParameter),
                            @"LimitExceededException" : @(AWSQldbErrorLimitExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSQldbErrorResourceAlreadyExists),
                            @"ResourceInUseException" : @(AWSQldbErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSQldbErrorResourceNotFound),
                            @"ResourcePreconditionNotMetException" : @(AWSQldbErrorResourcePreconditionNotMet),
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
                    *error = [NSError errorWithDomain:AWSQldbErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSQldbErrorDomain
                                                 code:AWSQldbErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSQldbErrorDomain
                                     code:AWSQldbErrorUnknown
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

@interface AWSQldbRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSQldbRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSQldb()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSQldb

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSQldbSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSQldb versions need to match. Check your SDK installation. AWSCore: %@ AWSQldb: %@", AWSiOSSDKVersion, AWSQldbSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultQldb {
    static AWSQldb *_defaultQldb = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoQldb];
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
        _defaultQldb = [[AWSQldb alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultQldb;
}

+ (void)registerQldbWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSQldb alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)QldbForKey:(NSString *)key {
    @synchronized(self) {
        AWSQldb *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoQldb
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSQldb registerQldbWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeQldbForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultQldb` or `+ QldbForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceQldb
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceQldb];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSQldbRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSQldbResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSQldbResponseSerializer alloc] initWithJSONDefinition:[[AWSQldbResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSQldbCancelJournalKinesisStreamResponse *> *)cancelJournalKinesisStream:(AWSQldbCancelJournalKinesisStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/ledgers/{name}/journal-kinesis-streams/{streamId}"
                  targetPrefix:@""
                 operationName:@"CancelJournalKinesisStream"
                   outputClass:[AWSQldbCancelJournalKinesisStreamResponse class]];
}

- (void)cancelJournalKinesisStream:(AWSQldbCancelJournalKinesisStreamRequest *)request
     completionHandler:(void (^)(AWSQldbCancelJournalKinesisStreamResponse *response, NSError *error))completionHandler {
    [[self cancelJournalKinesisStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbCancelJournalKinesisStreamResponse *> * _Nonnull task) {
        AWSQldbCancelJournalKinesisStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbCreateLedgerResponse *> *)createLedger:(AWSQldbCreateLedgerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ledgers"
                  targetPrefix:@""
                 operationName:@"CreateLedger"
                   outputClass:[AWSQldbCreateLedgerResponse class]];
}

- (void)createLedger:(AWSQldbCreateLedgerRequest *)request
     completionHandler:(void (^)(AWSQldbCreateLedgerResponse *response, NSError *error))completionHandler {
    [[self createLedger:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbCreateLedgerResponse *> * _Nonnull task) {
        AWSQldbCreateLedgerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteLedger:(AWSQldbDeleteLedgerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/ledgers/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteLedger"
                   outputClass:nil];
}

- (void)deleteLedger:(AWSQldbDeleteLedgerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteLedger:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbDescribeJournalKinesisStreamResponse *> *)describeJournalKinesisStream:(AWSQldbDescribeJournalKinesisStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/ledgers/{name}/journal-kinesis-streams/{streamId}"
                  targetPrefix:@""
                 operationName:@"DescribeJournalKinesisStream"
                   outputClass:[AWSQldbDescribeJournalKinesisStreamResponse class]];
}

- (void)describeJournalKinesisStream:(AWSQldbDescribeJournalKinesisStreamRequest *)request
     completionHandler:(void (^)(AWSQldbDescribeJournalKinesisStreamResponse *response, NSError *error))completionHandler {
    [[self describeJournalKinesisStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbDescribeJournalKinesisStreamResponse *> * _Nonnull task) {
        AWSQldbDescribeJournalKinesisStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbDescribeJournalS3ExportResponse *> *)describeJournalS3Export:(AWSQldbDescribeJournalS3ExportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/ledgers/{name}/journal-s3-exports/{exportId}"
                  targetPrefix:@""
                 operationName:@"DescribeJournalS3Export"
                   outputClass:[AWSQldbDescribeJournalS3ExportResponse class]];
}

- (void)describeJournalS3Export:(AWSQldbDescribeJournalS3ExportRequest *)request
     completionHandler:(void (^)(AWSQldbDescribeJournalS3ExportResponse *response, NSError *error))completionHandler {
    [[self describeJournalS3Export:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbDescribeJournalS3ExportResponse *> * _Nonnull task) {
        AWSQldbDescribeJournalS3ExportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbDescribeLedgerResponse *> *)describeLedger:(AWSQldbDescribeLedgerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/ledgers/{name}"
                  targetPrefix:@""
                 operationName:@"DescribeLedger"
                   outputClass:[AWSQldbDescribeLedgerResponse class]];
}

- (void)describeLedger:(AWSQldbDescribeLedgerRequest *)request
     completionHandler:(void (^)(AWSQldbDescribeLedgerResponse *response, NSError *error))completionHandler {
    [[self describeLedger:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbDescribeLedgerResponse *> * _Nonnull task) {
        AWSQldbDescribeLedgerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbExportJournalToS3Response *> *)exportJournalToS3:(AWSQldbExportJournalToS3Request *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ledgers/{name}/journal-s3-exports"
                  targetPrefix:@""
                 operationName:@"ExportJournalToS3"
                   outputClass:[AWSQldbExportJournalToS3Response class]];
}

- (void)exportJournalToS3:(AWSQldbExportJournalToS3Request *)request
     completionHandler:(void (^)(AWSQldbExportJournalToS3Response *response, NSError *error))completionHandler {
    [[self exportJournalToS3:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbExportJournalToS3Response *> * _Nonnull task) {
        AWSQldbExportJournalToS3Response *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbGetBlockResponse *> *)getBlock:(AWSQldbGetBlockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ledgers/{name}/block"
                  targetPrefix:@""
                 operationName:@"GetBlock"
                   outputClass:[AWSQldbGetBlockResponse class]];
}

- (void)getBlock:(AWSQldbGetBlockRequest *)request
     completionHandler:(void (^)(AWSQldbGetBlockResponse *response, NSError *error))completionHandler {
    [[self getBlock:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbGetBlockResponse *> * _Nonnull task) {
        AWSQldbGetBlockResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbGetDigestResponse *> *)getDigest:(AWSQldbGetDigestRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ledgers/{name}/digest"
                  targetPrefix:@""
                 operationName:@"GetDigest"
                   outputClass:[AWSQldbGetDigestResponse class]];
}

- (void)getDigest:(AWSQldbGetDigestRequest *)request
     completionHandler:(void (^)(AWSQldbGetDigestResponse *response, NSError *error))completionHandler {
    [[self getDigest:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbGetDigestResponse *> * _Nonnull task) {
        AWSQldbGetDigestResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbGetRevisionResponse *> *)getRevision:(AWSQldbGetRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ledgers/{name}/revision"
                  targetPrefix:@""
                 operationName:@"GetRevision"
                   outputClass:[AWSQldbGetRevisionResponse class]];
}

- (void)getRevision:(AWSQldbGetRevisionRequest *)request
     completionHandler:(void (^)(AWSQldbGetRevisionResponse *response, NSError *error))completionHandler {
    [[self getRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbGetRevisionResponse *> * _Nonnull task) {
        AWSQldbGetRevisionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbListJournalKinesisStreamsForLedgerResponse *> *)listJournalKinesisStreamsForLedger:(AWSQldbListJournalKinesisStreamsForLedgerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/ledgers/{name}/journal-kinesis-streams"
                  targetPrefix:@""
                 operationName:@"ListJournalKinesisStreamsForLedger"
                   outputClass:[AWSQldbListJournalKinesisStreamsForLedgerResponse class]];
}

- (void)listJournalKinesisStreamsForLedger:(AWSQldbListJournalKinesisStreamsForLedgerRequest *)request
     completionHandler:(void (^)(AWSQldbListJournalKinesisStreamsForLedgerResponse *response, NSError *error))completionHandler {
    [[self listJournalKinesisStreamsForLedger:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbListJournalKinesisStreamsForLedgerResponse *> * _Nonnull task) {
        AWSQldbListJournalKinesisStreamsForLedgerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbListJournalS3ExportsResponse *> *)listJournalS3Exports:(AWSQldbListJournalS3ExportsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/journal-s3-exports"
                  targetPrefix:@""
                 operationName:@"ListJournalS3Exports"
                   outputClass:[AWSQldbListJournalS3ExportsResponse class]];
}

- (void)listJournalS3Exports:(AWSQldbListJournalS3ExportsRequest *)request
     completionHandler:(void (^)(AWSQldbListJournalS3ExportsResponse *response, NSError *error))completionHandler {
    [[self listJournalS3Exports:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbListJournalS3ExportsResponse *> * _Nonnull task) {
        AWSQldbListJournalS3ExportsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbListJournalS3ExportsForLedgerResponse *> *)listJournalS3ExportsForLedger:(AWSQldbListJournalS3ExportsForLedgerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/ledgers/{name}/journal-s3-exports"
                  targetPrefix:@""
                 operationName:@"ListJournalS3ExportsForLedger"
                   outputClass:[AWSQldbListJournalS3ExportsForLedgerResponse class]];
}

- (void)listJournalS3ExportsForLedger:(AWSQldbListJournalS3ExportsForLedgerRequest *)request
     completionHandler:(void (^)(AWSQldbListJournalS3ExportsForLedgerResponse *response, NSError *error))completionHandler {
    [[self listJournalS3ExportsForLedger:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbListJournalS3ExportsForLedgerResponse *> * _Nonnull task) {
        AWSQldbListJournalS3ExportsForLedgerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbListLedgersResponse *> *)listLedgers:(AWSQldbListLedgersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/ledgers"
                  targetPrefix:@""
                 operationName:@"ListLedgers"
                   outputClass:[AWSQldbListLedgersResponse class]];
}

- (void)listLedgers:(AWSQldbListLedgersRequest *)request
     completionHandler:(void (^)(AWSQldbListLedgersResponse *response, NSError *error))completionHandler {
    [[self listLedgers:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbListLedgersResponse *> * _Nonnull task) {
        AWSQldbListLedgersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbListTagsForResourceResponse *> *)listTagsForResource:(AWSQldbListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSQldbListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSQldbListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSQldbListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbListTagsForResourceResponse *> * _Nonnull task) {
        AWSQldbListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbStreamJournalToKinesisResponse *> *)streamJournalToKinesis:(AWSQldbStreamJournalToKinesisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ledgers/{name}/journal-kinesis-streams"
                  targetPrefix:@""
                 operationName:@"StreamJournalToKinesis"
                   outputClass:[AWSQldbStreamJournalToKinesisResponse class]];
}

- (void)streamJournalToKinesis:(AWSQldbStreamJournalToKinesisRequest *)request
     completionHandler:(void (^)(AWSQldbStreamJournalToKinesisResponse *response, NSError *error))completionHandler {
    [[self streamJournalToKinesis:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbStreamJournalToKinesisResponse *> * _Nonnull task) {
        AWSQldbStreamJournalToKinesisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbTagResourceResponse *> *)tagResource:(AWSQldbTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSQldbTagResourceResponse class]];
}

- (void)tagResource:(AWSQldbTagResourceRequest *)request
     completionHandler:(void (^)(AWSQldbTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbTagResourceResponse *> * _Nonnull task) {
        AWSQldbTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbUntagResourceResponse *> *)untagResource:(AWSQldbUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSQldbUntagResourceResponse class]];
}

- (void)untagResource:(AWSQldbUntagResourceRequest *)request
     completionHandler:(void (^)(AWSQldbUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbUntagResourceResponse *> * _Nonnull task) {
        AWSQldbUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQldbUpdateLedgerResponse *> *)updateLedger:(AWSQldbUpdateLedgerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/ledgers/{name}"
                  targetPrefix:@""
                 operationName:@"UpdateLedger"
                   outputClass:[AWSQldbUpdateLedgerResponse class]];
}

- (void)updateLedger:(AWSQldbUpdateLedgerRequest *)request
     completionHandler:(void (^)(AWSQldbUpdateLedgerResponse *response, NSError *error))completionHandler {
    [[self updateLedger:request] continueWithBlock:^id _Nullable(AWSTask<AWSQldbUpdateLedgerResponse *> * _Nonnull task) {
        AWSQldbUpdateLedgerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
