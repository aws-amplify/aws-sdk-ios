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

#import "AWSMarketplacecatalogService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSMarketplacecatalogResources.h"

static NSString *const AWSInfoMarketplacecatalog = @"Marketplacecatalog";
NSString *const AWSMarketplacecatalogSDKVersion = @"2.13.4";


@interface AWSMarketplacecatalogResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSMarketplacecatalogResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSMarketplacecatalogErrorAccessDenied),
                            @"InternalServiceException" : @(AWSMarketplacecatalogErrorInternalService),
                            @"ResourceInUseException" : @(AWSMarketplacecatalogErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSMarketplacecatalogErrorResourceNotFound),
                            @"ResourceNotSupportedException" : @(AWSMarketplacecatalogErrorResourceNotSupported),
                            @"ServiceQuotaExceededException" : @(AWSMarketplacecatalogErrorServiceQuotaExceeded),
                            @"ThrottlingException" : @(AWSMarketplacecatalogErrorThrottling),
                            @"ValidationException" : @(AWSMarketplacecatalogErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSMarketplacecatalogErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSMarketplacecatalogErrorDomain
                                                 code:AWSMarketplacecatalogErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSMarketplacecatalogErrorDomain
                                     code:AWSMarketplacecatalogErrorUnknown
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

@interface AWSMarketplacecatalogRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSMarketplacecatalogRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSMarketplacecatalog()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSMarketplacecatalog

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSMarketplacecatalogSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSMarketplacecatalog versions need to match. Check your SDK installation. AWSCore: %@ AWSMarketplacecatalog: %@", AWSiOSSDKVersion, AWSMarketplacecatalogSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultMarketplacecatalog {
    static AWSMarketplacecatalog *_defaultMarketplacecatalog = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoMarketplacecatalog];
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
        _defaultMarketplacecatalog = [[AWSMarketplacecatalog alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultMarketplacecatalog;
}

+ (void)registerMarketplacecatalogWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSMarketplacecatalog alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)MarketplacecatalogForKey:(NSString *)key {
    @synchronized(self) {
        AWSMarketplacecatalog *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoMarketplacecatalog
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSMarketplacecatalog registerMarketplacecatalogWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeMarketplacecatalogForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultMarketplacecatalog` or `+ MarketplacecatalogForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceMarketplacecatalog
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceMarketplacecatalog];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSMarketplacecatalogRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSMarketplacecatalogResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSMarketplacecatalogResponseSerializer alloc] initWithJSONDefinition:[[AWSMarketplacecatalogResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSMarketplacecatalogCancelChangeSetResponse *> *)cancelChangeSet:(AWSMarketplacecatalogCancelChangeSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/CancelChangeSet"
                  targetPrefix:@""
                 operationName:@"CancelChangeSet"
                   outputClass:[AWSMarketplacecatalogCancelChangeSetResponse class]];
}

- (void)cancelChangeSet:(AWSMarketplacecatalogCancelChangeSetRequest *)request
     completionHandler:(void (^)(AWSMarketplacecatalogCancelChangeSetResponse *response, NSError *error))completionHandler {
    [[self cancelChangeSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSMarketplacecatalogCancelChangeSetResponse *> * _Nonnull task) {
        AWSMarketplacecatalogCancelChangeSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMarketplacecatalogDescribeChangeSetResponse *> *)describeChangeSet:(AWSMarketplacecatalogDescribeChangeSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/DescribeChangeSet"
                  targetPrefix:@""
                 operationName:@"DescribeChangeSet"
                   outputClass:[AWSMarketplacecatalogDescribeChangeSetResponse class]];
}

- (void)describeChangeSet:(AWSMarketplacecatalogDescribeChangeSetRequest *)request
     completionHandler:(void (^)(AWSMarketplacecatalogDescribeChangeSetResponse *response, NSError *error))completionHandler {
    [[self describeChangeSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSMarketplacecatalogDescribeChangeSetResponse *> * _Nonnull task) {
        AWSMarketplacecatalogDescribeChangeSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMarketplacecatalogDescribeEntityResponse *> *)describeEntity:(AWSMarketplacecatalogDescribeEntityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/DescribeEntity"
                  targetPrefix:@""
                 operationName:@"DescribeEntity"
                   outputClass:[AWSMarketplacecatalogDescribeEntityResponse class]];
}

- (void)describeEntity:(AWSMarketplacecatalogDescribeEntityRequest *)request
     completionHandler:(void (^)(AWSMarketplacecatalogDescribeEntityResponse *response, NSError *error))completionHandler {
    [[self describeEntity:request] continueWithBlock:^id _Nullable(AWSTask<AWSMarketplacecatalogDescribeEntityResponse *> * _Nonnull task) {
        AWSMarketplacecatalogDescribeEntityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMarketplacecatalogListChangeSetsResponse *> *)listChangeSets:(AWSMarketplacecatalogListChangeSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListChangeSets"
                  targetPrefix:@""
                 operationName:@"ListChangeSets"
                   outputClass:[AWSMarketplacecatalogListChangeSetsResponse class]];
}

- (void)listChangeSets:(AWSMarketplacecatalogListChangeSetsRequest *)request
     completionHandler:(void (^)(AWSMarketplacecatalogListChangeSetsResponse *response, NSError *error))completionHandler {
    [[self listChangeSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSMarketplacecatalogListChangeSetsResponse *> * _Nonnull task) {
        AWSMarketplacecatalogListChangeSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMarketplacecatalogListEntitiesResponse *> *)listEntities:(AWSMarketplacecatalogListEntitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListEntities"
                  targetPrefix:@""
                 operationName:@"ListEntities"
                   outputClass:[AWSMarketplacecatalogListEntitiesResponse class]];
}

- (void)listEntities:(AWSMarketplacecatalogListEntitiesRequest *)request
     completionHandler:(void (^)(AWSMarketplacecatalogListEntitiesResponse *response, NSError *error))completionHandler {
    [[self listEntities:request] continueWithBlock:^id _Nullable(AWSTask<AWSMarketplacecatalogListEntitiesResponse *> * _Nonnull task) {
        AWSMarketplacecatalogListEntitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMarketplacecatalogStartChangeSetResponse *> *)startChangeSet:(AWSMarketplacecatalogStartChangeSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/StartChangeSet"
                  targetPrefix:@""
                 operationName:@"StartChangeSet"
                   outputClass:[AWSMarketplacecatalogStartChangeSetResponse class]];
}

- (void)startChangeSet:(AWSMarketplacecatalogStartChangeSetRequest *)request
     completionHandler:(void (^)(AWSMarketplacecatalogStartChangeSetResponse *response, NSError *error))completionHandler {
    [[self startChangeSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSMarketplacecatalogStartChangeSetResponse *> * _Nonnull task) {
        AWSMarketplacecatalogStartChangeSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
