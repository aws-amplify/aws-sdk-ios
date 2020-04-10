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

#import "AWSKinesisVideoArchivedMediaService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSKinesisVideoArchivedMediaResources.h"

static NSString *const AWSInfoKinesisVideoArchivedMedia = @"KinesisVideoArchivedMedia";
NSString *const AWSKinesisVideoArchivedMediaSDKVersion = @"2.13.2";


@interface AWSKinesisVideoArchivedMediaResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSKinesisVideoArchivedMediaResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ClientLimitExceededException" : @(AWSKinesisVideoArchivedMediaErrorClientLimitExceeded),
                            @"InvalidArgumentException" : @(AWSKinesisVideoArchivedMediaErrorInvalidArgument),
                            @"InvalidCodecPrivateDataException" : @(AWSKinesisVideoArchivedMediaErrorInvalidCodecPrivateData),
                            @"MissingCodecPrivateDataException" : @(AWSKinesisVideoArchivedMediaErrorMissingCodecPrivateData),
                            @"NoDataRetentionException" : @(AWSKinesisVideoArchivedMediaErrorNoDataRetention),
                            @"NotAuthorizedException" : @(AWSKinesisVideoArchivedMediaErrorNotAuthorized),
                            @"ResourceNotFoundException" : @(AWSKinesisVideoArchivedMediaErrorResourceNotFound),
                            @"UnsupportedStreamMediaTypeException" : @(AWSKinesisVideoArchivedMediaErrorUnsupportedStreamMediaType),
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
                    *error = [NSError errorWithDomain:AWSKinesisVideoArchivedMediaErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSKinesisVideoArchivedMediaErrorDomain
                                                 code:AWSKinesisVideoArchivedMediaErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSKinesisVideoArchivedMediaErrorDomain
                                     code:AWSKinesisVideoArchivedMediaErrorUnknown
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

@interface AWSKinesisVideoArchivedMediaRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSKinesisVideoArchivedMediaRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSKinesisVideoArchivedMedia()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSKinesisVideoArchivedMedia

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSKinesisVideoArchivedMediaSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSKinesisVideoArchivedMedia versions need to match. Check your SDK installation. AWSCore: %@ AWSKinesisVideoArchivedMedia: %@", AWSiOSSDKVersion, AWSKinesisVideoArchivedMediaSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultKinesisVideoArchivedMedia {
    static AWSKinesisVideoArchivedMedia *_defaultKinesisVideoArchivedMedia = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoKinesisVideoArchivedMedia];
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
        _defaultKinesisVideoArchivedMedia = [[AWSKinesisVideoArchivedMedia alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultKinesisVideoArchivedMedia;
}

+ (void)registerKinesisVideoArchivedMediaWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSKinesisVideoArchivedMedia alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)KinesisVideoArchivedMediaForKey:(NSString *)key {
    @synchronized(self) {
        AWSKinesisVideoArchivedMedia *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoKinesisVideoArchivedMedia
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeKinesisVideoArchivedMediaForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultKinesisVideoArchivedMedia` or `+ KinesisVideoArchivedMediaForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceKinesisVideoArchivedMedia
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceKinesisVideoArchivedMedia];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSKinesisVideoArchivedMediaRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSKinesisVideoArchivedMediaResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSKinesisVideoArchivedMediaResponseSerializer alloc] initWithJSONDefinition:[[AWSKinesisVideoArchivedMediaResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput *> *)getHLSStreamingSessionURL:(AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getHLSStreamingSessionURL"
                  targetPrefix:@""
                 operationName:@"GetHLSStreamingSessionURL"
                   outputClass:[AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput class]];
}

- (void)getHLSStreamingSessionURL:(AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput *)request
     completionHandler:(void (^)(AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput *response, NSError *error))completionHandler {
    [[self getHLSStreamingSessionURL:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput *> * _Nonnull task) {
        AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput *> *)getMediaForFragmentList:(AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getMediaForFragmentList"
                  targetPrefix:@""
                 operationName:@"GetMediaForFragmentList"
                   outputClass:[AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput class]];
}

- (void)getMediaForFragmentList:(AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput *)request
     completionHandler:(void (^)(AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput *response, NSError *error))completionHandler {
    [[self getMediaForFragmentList:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput *> * _Nonnull task) {
        AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoArchivedMediaListFragmentsOutput *> *)listFragments:(AWSKinesisVideoArchivedMediaListFragmentsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listFragments"
                  targetPrefix:@""
                 operationName:@"ListFragments"
                   outputClass:[AWSKinesisVideoArchivedMediaListFragmentsOutput class]];
}

- (void)listFragments:(AWSKinesisVideoArchivedMediaListFragmentsInput *)request
     completionHandler:(void (^)(AWSKinesisVideoArchivedMediaListFragmentsOutput *response, NSError *error))completionHandler {
    [[self listFragments:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoArchivedMediaListFragmentsOutput *> * _Nonnull task) {
        AWSKinesisVideoArchivedMediaListFragmentsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
