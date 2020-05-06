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

#import "AWSAWSCodeStarconnectionsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAWSCodeStarconnectionsResources.h"

static NSString *const AWSInfoAWSCodeStarconnections = @"AWSCodeStarconnections";
NSString *const AWSAWSCodeStarconnectionsSDKVersion = @"2.13.3";


@interface AWSAWSCodeStarconnectionsResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSAWSCodeStarconnectionsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"LimitExceededException" : @(AWSAWSCodeStarconnectionsErrorLimitExceeded),
                            @"ResourceNotFoundException" : @(AWSAWSCodeStarconnectionsErrorResourceNotFound),
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
	                *error = [NSError errorWithDomain:AWSAWSCodeStarconnectionsErrorDomain
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
        *error = [NSError errorWithDomain:AWSAWSCodeStarconnectionsErrorDomain
                                     code:AWSAWSCodeStarconnectionsErrorUnknown
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

@interface AWSAWSCodeStarconnectionsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAWSCodeStarconnectionsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAWSCodeStarconnections()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAWSCodeStarconnections

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAWSCodeStarconnectionsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAWSCodeStarconnections versions need to match. Check your SDK installation. AWSCore: %@ AWSAWSCodeStarconnections: %@", AWSiOSSDKVersion, AWSAWSCodeStarconnectionsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAWSCodeStarconnections {
    static AWSAWSCodeStarconnections *_defaultAWSCodeStarconnections = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAWSCodeStarconnections];
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
        _defaultAWSCodeStarconnections = [[AWSAWSCodeStarconnections alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAWSCodeStarconnections;
}

+ (void)registerAWSCodeStarconnectionsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAWSCodeStarconnections alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AWSCodeStarconnectionsForKey:(NSString *)key {
    @synchronized(self) {
        AWSAWSCodeStarconnections *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAWSCodeStarconnections
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAWSCodeStarconnections registerAWSCodeStarconnectionsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAWSCodeStarconnectionsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAWSCodeStarconnections` or `+ AWSCodeStarconnectionsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAWSCodeStarconnections
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAWSCodeStarconnections];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAWSCodeStarconnectionsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

		NSMutableDictionary *headers = [NSMutableDictionary new];
        headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
        networkingRequest.headers = headers;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSAWSCodeStarconnectionsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAWSCodeStarconnectionsResponseSerializer alloc] initWithJSONDefinition:[[AWSAWSCodeStarconnectionsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSAWSCodeStarconnectionsCreateConnectionOutput *> *)createConnection:(AWSAWSCodeStarconnectionsCreateConnectionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"com.amazonaws.codestar.connections.CodeStar_connections_20191201"
                 operationName:@"CreateConnection"
                   outputClass:[AWSAWSCodeStarconnectionsCreateConnectionOutput class]];
}

- (void)createConnection:(AWSAWSCodeStarconnectionsCreateConnectionInput *)request
     completionHandler:(void (^)(AWSAWSCodeStarconnectionsCreateConnectionOutput *response, NSError *error))completionHandler {
    [[self createConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSCodeStarconnectionsCreateConnectionOutput *> * _Nonnull task) {
        AWSAWSCodeStarconnectionsCreateConnectionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSCodeStarconnectionsDeleteConnectionOutput *> *)deleteConnection:(AWSAWSCodeStarconnectionsDeleteConnectionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"com.amazonaws.codestar.connections.CodeStar_connections_20191201"
                 operationName:@"DeleteConnection"
                   outputClass:[AWSAWSCodeStarconnectionsDeleteConnectionOutput class]];
}

- (void)deleteConnection:(AWSAWSCodeStarconnectionsDeleteConnectionInput *)request
     completionHandler:(void (^)(AWSAWSCodeStarconnectionsDeleteConnectionOutput *response, NSError *error))completionHandler {
    [[self deleteConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSCodeStarconnectionsDeleteConnectionOutput *> * _Nonnull task) {
        AWSAWSCodeStarconnectionsDeleteConnectionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSCodeStarconnectionsGetConnectionOutput *> *)getConnection:(AWSAWSCodeStarconnectionsGetConnectionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"com.amazonaws.codestar.connections.CodeStar_connections_20191201"
                 operationName:@"GetConnection"
                   outputClass:[AWSAWSCodeStarconnectionsGetConnectionOutput class]];
}

- (void)getConnection:(AWSAWSCodeStarconnectionsGetConnectionInput *)request
     completionHandler:(void (^)(AWSAWSCodeStarconnectionsGetConnectionOutput *response, NSError *error))completionHandler {
    [[self getConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSCodeStarconnectionsGetConnectionOutput *> * _Nonnull task) {
        AWSAWSCodeStarconnectionsGetConnectionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSCodeStarconnectionsListConnectionsOutput *> *)listConnections:(AWSAWSCodeStarconnectionsListConnectionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"com.amazonaws.codestar.connections.CodeStar_connections_20191201"
                 operationName:@"ListConnections"
                   outputClass:[AWSAWSCodeStarconnectionsListConnectionsOutput class]];
}

- (void)listConnections:(AWSAWSCodeStarconnectionsListConnectionsInput *)request
     completionHandler:(void (^)(AWSAWSCodeStarconnectionsListConnectionsOutput *response, NSError *error))completionHandler {
    [[self listConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSCodeStarconnectionsListConnectionsOutput *> * _Nonnull task) {
        AWSAWSCodeStarconnectionsListConnectionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSCodeStarconnectionsListTagsForResourceOutput *> *)listTagsForResource:(AWSAWSCodeStarconnectionsListTagsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"com.amazonaws.codestar.connections.CodeStar_connections_20191201"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSAWSCodeStarconnectionsListTagsForResourceOutput class]];
}

- (void)listTagsForResource:(AWSAWSCodeStarconnectionsListTagsForResourceInput *)request
     completionHandler:(void (^)(AWSAWSCodeStarconnectionsListTagsForResourceOutput *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSCodeStarconnectionsListTagsForResourceOutput *> * _Nonnull task) {
        AWSAWSCodeStarconnectionsListTagsForResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSCodeStarconnectionsTagResourceOutput *> *)tagResource:(AWSAWSCodeStarconnectionsTagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"com.amazonaws.codestar.connections.CodeStar_connections_20191201"
                 operationName:@"TagResource"
                   outputClass:[AWSAWSCodeStarconnectionsTagResourceOutput class]];
}

- (void)tagResource:(AWSAWSCodeStarconnectionsTagResourceInput *)request
     completionHandler:(void (^)(AWSAWSCodeStarconnectionsTagResourceOutput *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSCodeStarconnectionsTagResourceOutput *> * _Nonnull task) {
        AWSAWSCodeStarconnectionsTagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSCodeStarconnectionsUntagResourceOutput *> *)untagResource:(AWSAWSCodeStarconnectionsUntagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"com.amazonaws.codestar.connections.CodeStar_connections_20191201"
                 operationName:@"UntagResource"
                   outputClass:[AWSAWSCodeStarconnectionsUntagResourceOutput class]];
}

- (void)untagResource:(AWSAWSCodeStarconnectionsUntagResourceInput *)request
     completionHandler:(void (^)(AWSAWSCodeStarconnectionsUntagResourceOutput *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSCodeStarconnectionsUntagResourceOutput *> * _Nonnull task) {
        AWSAWSCodeStarconnectionsUntagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
