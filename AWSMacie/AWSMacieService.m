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

#import "AWSMacieService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSMacieResources.h"

static NSString *const AWSInfoMacie = @"Macie";
NSString *const AWSMacieSDKVersion = @"2.13.4";


@interface AWSMacieResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSMacieResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSMacieErrorAccessDenied),
                            @"InternalException" : @(AWSMacieErrorInternal),
                            @"InvalidInputException" : @(AWSMacieErrorInvalidInput),
                            @"LimitExceededException" : @(AWSMacieErrorLimitExceeded),
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
	                *error = [NSError errorWithDomain:AWSMacieErrorDomain
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
        *error = [NSError errorWithDomain:AWSMacieErrorDomain
                                     code:AWSMacieErrorUnknown
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

@interface AWSMacieRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSMacieRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSMacie()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSMacie

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSMacieSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSMacie versions need to match. Check your SDK installation. AWSCore: %@ AWSMacie: %@", AWSiOSSDKVersion, AWSMacieSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultMacie {
    static AWSMacie *_defaultMacie = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoMacie];
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
        _defaultMacie = [[AWSMacie alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultMacie;
}

+ (void)registerMacieWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSMacie alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)MacieForKey:(NSString *)key {
    @synchronized(self) {
        AWSMacie *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoMacie
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSMacie registerMacieWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeMacieForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultMacie` or `+ MacieForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceMacie
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceMacie];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSMacieRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSMacieResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSMacieResponseSerializer alloc] initWithJSONDefinition:[[AWSMacieResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)associateMemberAccount:(AWSMacieAssociateMemberAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"MacieService"
                 operationName:@"AssociateMemberAccount"
                   outputClass:nil];
}

- (void)associateMemberAccount:(AWSMacieAssociateMemberAccountRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateMemberAccount:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMacieAssociateS3ResourcesResult *> *)associateS3Resources:(AWSMacieAssociateS3ResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"MacieService"
                 operationName:@"AssociateS3Resources"
                   outputClass:[AWSMacieAssociateS3ResourcesResult class]];
}

- (void)associateS3Resources:(AWSMacieAssociateS3ResourcesRequest *)request
     completionHandler:(void (^)(AWSMacieAssociateS3ResourcesResult *response, NSError *error))completionHandler {
    [[self associateS3Resources:request] continueWithBlock:^id _Nullable(AWSTask<AWSMacieAssociateS3ResourcesResult *> * _Nonnull task) {
        AWSMacieAssociateS3ResourcesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateMemberAccount:(AWSMacieDisassociateMemberAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"MacieService"
                 operationName:@"DisassociateMemberAccount"
                   outputClass:nil];
}

- (void)disassociateMemberAccount:(AWSMacieDisassociateMemberAccountRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateMemberAccount:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMacieDisassociateS3ResourcesResult *> *)disassociateS3Resources:(AWSMacieDisassociateS3ResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"MacieService"
                 operationName:@"DisassociateS3Resources"
                   outputClass:[AWSMacieDisassociateS3ResourcesResult class]];
}

- (void)disassociateS3Resources:(AWSMacieDisassociateS3ResourcesRequest *)request
     completionHandler:(void (^)(AWSMacieDisassociateS3ResourcesResult *response, NSError *error))completionHandler {
    [[self disassociateS3Resources:request] continueWithBlock:^id _Nullable(AWSTask<AWSMacieDisassociateS3ResourcesResult *> * _Nonnull task) {
        AWSMacieDisassociateS3ResourcesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMacieListMemberAccountsResult *> *)listMemberAccounts:(AWSMacieListMemberAccountsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"MacieService"
                 operationName:@"ListMemberAccounts"
                   outputClass:[AWSMacieListMemberAccountsResult class]];
}

- (void)listMemberAccounts:(AWSMacieListMemberAccountsRequest *)request
     completionHandler:(void (^)(AWSMacieListMemberAccountsResult *response, NSError *error))completionHandler {
    [[self listMemberAccounts:request] continueWithBlock:^id _Nullable(AWSTask<AWSMacieListMemberAccountsResult *> * _Nonnull task) {
        AWSMacieListMemberAccountsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMacieListS3ResourcesResult *> *)listS3Resources:(AWSMacieListS3ResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"MacieService"
                 operationName:@"ListS3Resources"
                   outputClass:[AWSMacieListS3ResourcesResult class]];
}

- (void)listS3Resources:(AWSMacieListS3ResourcesRequest *)request
     completionHandler:(void (^)(AWSMacieListS3ResourcesResult *response, NSError *error))completionHandler {
    [[self listS3Resources:request] continueWithBlock:^id _Nullable(AWSTask<AWSMacieListS3ResourcesResult *> * _Nonnull task) {
        AWSMacieListS3ResourcesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMacieUpdateS3ResourcesResult *> *)updateS3Resources:(AWSMacieUpdateS3ResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"MacieService"
                 operationName:@"UpdateS3Resources"
                   outputClass:[AWSMacieUpdateS3ResourcesResult class]];
}

- (void)updateS3Resources:(AWSMacieUpdateS3ResourcesRequest *)request
     completionHandler:(void (^)(AWSMacieUpdateS3ResourcesResult *response, NSError *error))completionHandler {
    [[self updateS3Resources:request] continueWithBlock:^id _Nullable(AWSTask<AWSMacieUpdateS3ResourcesResult *> * _Nonnull task) {
        AWSMacieUpdateS3ResourcesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
