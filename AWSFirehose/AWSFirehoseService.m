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

#import "AWSFirehoseService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSFirehoseResources.h"
#import "AWSFirehoseSerializer.h"

static NSString *const AWSInfoFirehose = @"Firehose";
NSString *const AWSFirehoseSDKVersion = @"2.13.2";


@interface AWSFirehoseResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSFirehoseResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConcurrentModificationException" : @(AWSFirehoseErrorConcurrentModification),
                            @"InvalidArgumentException" : @(AWSFirehoseErrorInvalidArgument),
                            @"InvalidKMSResourceException" : @(AWSFirehoseErrorInvalidKMSResource),
                            @"LimitExceededException" : @(AWSFirehoseErrorLimitExceeded),
                            @"ResourceInUseException" : @(AWSFirehoseErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSFirehoseErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSFirehoseErrorServiceUnavailable),
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
	                *error = [NSError errorWithDomain:AWSFirehoseErrorDomain
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
        *error = [NSError errorWithDomain:AWSFirehoseErrorDomain
                                     code:AWSFirehoseErrorUnknown
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

@interface AWSFirehoseRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSFirehoseRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSFirehose()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSFirehose

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSFirehoseSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSFirehose versions need to match. Check your SDK installation. AWSCore: %@ AWSFirehose: %@", AWSiOSSDKVersion, AWSFirehoseSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultFirehose {
    static AWSFirehose *_defaultFirehose = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoFirehose];
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
        _defaultFirehose = [[AWSFirehose alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultFirehose;
}

+ (void)registerFirehoseWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSFirehose alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)FirehoseForKey:(NSString *)key {
    @synchronized(self) {
        AWSFirehose *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoFirehose
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSFirehose registerFirehoseWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeFirehoseForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultFirehose` or `+ FirehoseForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceFirehose
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceFirehose];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSFirehoseRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
		networkingRequest.requestSerializer = [[AWSFirehoseRequestSerializer alloc] initWithJSONDefinition:[[AWSFirehoseResources sharedInstance] JSONObject]
		 															     actionName:operationName];
        networkingRequest.responseSerializer = [[AWSFirehoseResponseSerializer alloc] initWithJSONDefinition:[[AWSFirehoseResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSFirehoseCreateDeliveryStreamOutput *> *)createDeliveryStream:(AWSFirehoseCreateDeliveryStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"CreateDeliveryStream"
                   outputClass:[AWSFirehoseCreateDeliveryStreamOutput class]];
}

- (void)createDeliveryStream:(AWSFirehoseCreateDeliveryStreamInput *)request
     completionHandler:(void (^)(AWSFirehoseCreateDeliveryStreamOutput *response, NSError *error))completionHandler {
    [[self createDeliveryStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseCreateDeliveryStreamOutput *> * _Nonnull task) {
        AWSFirehoseCreateDeliveryStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehoseDeleteDeliveryStreamOutput *> *)deleteDeliveryStream:(AWSFirehoseDeleteDeliveryStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"DeleteDeliveryStream"
                   outputClass:[AWSFirehoseDeleteDeliveryStreamOutput class]];
}

- (void)deleteDeliveryStream:(AWSFirehoseDeleteDeliveryStreamInput *)request
     completionHandler:(void (^)(AWSFirehoseDeleteDeliveryStreamOutput *response, NSError *error))completionHandler {
    [[self deleteDeliveryStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseDeleteDeliveryStreamOutput *> * _Nonnull task) {
        AWSFirehoseDeleteDeliveryStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehoseDescribeDeliveryStreamOutput *> *)describeDeliveryStream:(AWSFirehoseDescribeDeliveryStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"DescribeDeliveryStream"
                   outputClass:[AWSFirehoseDescribeDeliveryStreamOutput class]];
}

- (void)describeDeliveryStream:(AWSFirehoseDescribeDeliveryStreamInput *)request
     completionHandler:(void (^)(AWSFirehoseDescribeDeliveryStreamOutput *response, NSError *error))completionHandler {
    [[self describeDeliveryStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseDescribeDeliveryStreamOutput *> * _Nonnull task) {
        AWSFirehoseDescribeDeliveryStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehoseListDeliveryStreamsOutput *> *)listDeliveryStreams:(AWSFirehoseListDeliveryStreamsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"ListDeliveryStreams"
                   outputClass:[AWSFirehoseListDeliveryStreamsOutput class]];
}

- (void)listDeliveryStreams:(AWSFirehoseListDeliveryStreamsInput *)request
     completionHandler:(void (^)(AWSFirehoseListDeliveryStreamsOutput *response, NSError *error))completionHandler {
    [[self listDeliveryStreams:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseListDeliveryStreamsOutput *> * _Nonnull task) {
        AWSFirehoseListDeliveryStreamsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehoseListTagsForDeliveryStreamOutput *> *)listTagsForDeliveryStream:(AWSFirehoseListTagsForDeliveryStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"ListTagsForDeliveryStream"
                   outputClass:[AWSFirehoseListTagsForDeliveryStreamOutput class]];
}

- (void)listTagsForDeliveryStream:(AWSFirehoseListTagsForDeliveryStreamInput *)request
     completionHandler:(void (^)(AWSFirehoseListTagsForDeliveryStreamOutput *response, NSError *error))completionHandler {
    [[self listTagsForDeliveryStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseListTagsForDeliveryStreamOutput *> * _Nonnull task) {
        AWSFirehoseListTagsForDeliveryStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehosePutRecordOutput *> *)putRecord:(AWSFirehosePutRecordInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"PutRecord"
                   outputClass:[AWSFirehosePutRecordOutput class]];
}

- (void)putRecord:(AWSFirehosePutRecordInput *)request
     completionHandler:(void (^)(AWSFirehosePutRecordOutput *response, NSError *error))completionHandler {
    [[self putRecord:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehosePutRecordOutput *> * _Nonnull task) {
        AWSFirehosePutRecordOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehosePutRecordBatchOutput *> *)putRecordBatch:(AWSFirehosePutRecordBatchInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"PutRecordBatch"
                   outputClass:[AWSFirehosePutRecordBatchOutput class]];
}

- (void)putRecordBatch:(AWSFirehosePutRecordBatchInput *)request
     completionHandler:(void (^)(AWSFirehosePutRecordBatchOutput *response, NSError *error))completionHandler {
    [[self putRecordBatch:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehosePutRecordBatchOutput *> * _Nonnull task) {
        AWSFirehosePutRecordBatchOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehoseStartDeliveryStreamEncryptionOutput *> *)startDeliveryStreamEncryption:(AWSFirehoseStartDeliveryStreamEncryptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"StartDeliveryStreamEncryption"
                   outputClass:[AWSFirehoseStartDeliveryStreamEncryptionOutput class]];
}

- (void)startDeliveryStreamEncryption:(AWSFirehoseStartDeliveryStreamEncryptionInput *)request
     completionHandler:(void (^)(AWSFirehoseStartDeliveryStreamEncryptionOutput *response, NSError *error))completionHandler {
    [[self startDeliveryStreamEncryption:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseStartDeliveryStreamEncryptionOutput *> * _Nonnull task) {
        AWSFirehoseStartDeliveryStreamEncryptionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehoseStopDeliveryStreamEncryptionOutput *> *)stopDeliveryStreamEncryption:(AWSFirehoseStopDeliveryStreamEncryptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"StopDeliveryStreamEncryption"
                   outputClass:[AWSFirehoseStopDeliveryStreamEncryptionOutput class]];
}

- (void)stopDeliveryStreamEncryption:(AWSFirehoseStopDeliveryStreamEncryptionInput *)request
     completionHandler:(void (^)(AWSFirehoseStopDeliveryStreamEncryptionOutput *response, NSError *error))completionHandler {
    [[self stopDeliveryStreamEncryption:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseStopDeliveryStreamEncryptionOutput *> * _Nonnull task) {
        AWSFirehoseStopDeliveryStreamEncryptionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehoseTagDeliveryStreamOutput *> *)tagDeliveryStream:(AWSFirehoseTagDeliveryStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"TagDeliveryStream"
                   outputClass:[AWSFirehoseTagDeliveryStreamOutput class]];
}

- (void)tagDeliveryStream:(AWSFirehoseTagDeliveryStreamInput *)request
     completionHandler:(void (^)(AWSFirehoseTagDeliveryStreamOutput *response, NSError *error))completionHandler {
    [[self tagDeliveryStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseTagDeliveryStreamOutput *> * _Nonnull task) {
        AWSFirehoseTagDeliveryStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehoseUntagDeliveryStreamOutput *> *)untagDeliveryStream:(AWSFirehoseUntagDeliveryStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"UntagDeliveryStream"
                   outputClass:[AWSFirehoseUntagDeliveryStreamOutput class]];
}

- (void)untagDeliveryStream:(AWSFirehoseUntagDeliveryStreamInput *)request
     completionHandler:(void (^)(AWSFirehoseUntagDeliveryStreamOutput *response, NSError *error))completionHandler {
    [[self untagDeliveryStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseUntagDeliveryStreamOutput *> * _Nonnull task) {
        AWSFirehoseUntagDeliveryStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFirehoseUpdateDestinationOutput *> *)updateDestination:(AWSFirehoseUpdateDestinationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Firehose_20150804"
                 operationName:@"UpdateDestination"
                   outputClass:[AWSFirehoseUpdateDestinationOutput class]];
}

- (void)updateDestination:(AWSFirehoseUpdateDestinationInput *)request
     completionHandler:(void (^)(AWSFirehoseUpdateDestinationOutput *response, NSError *error))completionHandler {
    [[self updateDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSFirehoseUpdateDestinationOutput *> * _Nonnull task) {
        AWSFirehoseUpdateDestinationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
