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

#import "AWSLexmodelbuildingserviceService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSLexmodelbuildingserviceResources.h"

static NSString *const AWSInfoLexmodelbuildingservice = @"Lexmodelbuildingservice";
NSString *const AWSLexmodelbuildingserviceSDKVersion = @"2.13.4";


@interface AWSLexmodelbuildingserviceResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSLexmodelbuildingserviceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSLexmodelbuildingserviceErrorBadRequest),
                            @"ConflictException" : @(AWSLexmodelbuildingserviceErrorConflict),
                            @"InternalFailureException" : @(AWSLexmodelbuildingserviceErrorInternalFailure),
                            @"LimitExceededException" : @(AWSLexmodelbuildingserviceErrorLimitExceeded),
                            @"NotFoundException" : @(AWSLexmodelbuildingserviceErrorNotFound),
                            @"PreconditionFailedException" : @(AWSLexmodelbuildingserviceErrorPreconditionFailed),
                            @"ResourceInUseException" : @(AWSLexmodelbuildingserviceErrorResourceInUse),
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
                    *error = [NSError errorWithDomain:AWSLexmodelbuildingserviceErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSLexmodelbuildingserviceErrorDomain
                                                 code:AWSLexmodelbuildingserviceErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSLexmodelbuildingserviceErrorDomain
                                     code:AWSLexmodelbuildingserviceErrorUnknown
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

@interface AWSLexmodelbuildingserviceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSLexmodelbuildingserviceRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSLexmodelbuildingservice()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSLexmodelbuildingservice

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSLexmodelbuildingserviceSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSLexmodelbuildingservice versions need to match. Check your SDK installation. AWSCore: %@ AWSLexmodelbuildingservice: %@", AWSiOSSDKVersion, AWSLexmodelbuildingserviceSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultLexmodelbuildingservice {
    static AWSLexmodelbuildingservice *_defaultLexmodelbuildingservice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoLexmodelbuildingservice];
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
        _defaultLexmodelbuildingservice = [[AWSLexmodelbuildingservice alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultLexmodelbuildingservice;
}

+ (void)registerLexmodelbuildingserviceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSLexmodelbuildingservice alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)LexmodelbuildingserviceForKey:(NSString *)key {
    @synchronized(self) {
        AWSLexmodelbuildingservice *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoLexmodelbuildingservice
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSLexmodelbuildingservice registerLexmodelbuildingserviceWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeLexmodelbuildingserviceForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultLexmodelbuildingservice` or `+ LexmodelbuildingserviceForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceLexmodelbuildingservice
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceLexmodelbuildingservice];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSLexmodelbuildingserviceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSLexmodelbuildingserviceResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSLexmodelbuildingserviceResponseSerializer alloc] initWithJSONDefinition:[[AWSLexmodelbuildingserviceResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSLexmodelbuildingserviceCreateBotVersionResponse *> *)createBotVersion:(AWSLexmodelbuildingserviceCreateBotVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/bots/{name}/versions"
                  targetPrefix:@""
                 operationName:@"CreateBotVersion"
                   outputClass:[AWSLexmodelbuildingserviceCreateBotVersionResponse class]];
}

- (void)createBotVersion:(AWSLexmodelbuildingserviceCreateBotVersionRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceCreateBotVersionResponse *response, NSError *error))completionHandler {
    [[self createBotVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceCreateBotVersionResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceCreateBotVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceCreateIntentVersionResponse *> *)createIntentVersion:(AWSLexmodelbuildingserviceCreateIntentVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/intents/{name}/versions"
                  targetPrefix:@""
                 operationName:@"CreateIntentVersion"
                   outputClass:[AWSLexmodelbuildingserviceCreateIntentVersionResponse class]];
}

- (void)createIntentVersion:(AWSLexmodelbuildingserviceCreateIntentVersionRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceCreateIntentVersionResponse *response, NSError *error))completionHandler {
    [[self createIntentVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceCreateIntentVersionResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceCreateIntentVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse *> *)createSlotTypeVersion:(AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/slottypes/{name}/versions"
                  targetPrefix:@""
                 operationName:@"CreateSlotTypeVersion"
                   outputClass:[AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse class]];
}

- (void)createSlotTypeVersion:(AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse *response, NSError *error))completionHandler {
    [[self createSlotTypeVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBot:(AWSLexmodelbuildingserviceDeleteBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/bots/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteBot"
                   outputClass:nil];
}

- (void)deleteBot:(AWSLexmodelbuildingserviceDeleteBotRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBot:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBotAlias:(AWSLexmodelbuildingserviceDeleteBotAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/bots/{botName}/aliases/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteBotAlias"
                   outputClass:nil];
}

- (void)deleteBotAlias:(AWSLexmodelbuildingserviceDeleteBotAliasRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBotAlias:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBotChannelAssociation:(AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/bots/{botName}/aliases/{aliasName}/channels/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteBotChannelAssociation"
                   outputClass:nil];
}

- (void)deleteBotChannelAssociation:(AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBotChannelAssociation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBotVersion:(AWSLexmodelbuildingserviceDeleteBotVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/bots/{name}/versions/{version}"
                  targetPrefix:@""
                 operationName:@"DeleteBotVersion"
                   outputClass:nil];
}

- (void)deleteBotVersion:(AWSLexmodelbuildingserviceDeleteBotVersionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBotVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteIntent:(AWSLexmodelbuildingserviceDeleteIntentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/intents/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteIntent"
                   outputClass:nil];
}

- (void)deleteIntent:(AWSLexmodelbuildingserviceDeleteIntentRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteIntent:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteIntentVersion:(AWSLexmodelbuildingserviceDeleteIntentVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/intents/{name}/versions/{version}"
                  targetPrefix:@""
                 operationName:@"DeleteIntentVersion"
                   outputClass:nil];
}

- (void)deleteIntentVersion:(AWSLexmodelbuildingserviceDeleteIntentVersionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteIntentVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSlotType:(AWSLexmodelbuildingserviceDeleteSlotTypeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/slottypes/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteSlotType"
                   outputClass:nil];
}

- (void)deleteSlotType:(AWSLexmodelbuildingserviceDeleteSlotTypeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSlotType:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSlotTypeVersion:(AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/slottypes/{name}/version/{version}"
                  targetPrefix:@""
                 operationName:@"DeleteSlotTypeVersion"
                   outputClass:nil];
}

- (void)deleteSlotTypeVersion:(AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSlotTypeVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUtterances:(AWSLexmodelbuildingserviceDeleteUtterancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/bots/{botName}/utterances/{userId}"
                  targetPrefix:@""
                 operationName:@"DeleteUtterances"
                   outputClass:nil];
}

- (void)deleteUtterances:(AWSLexmodelbuildingserviceDeleteUtterancesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUtterances:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBotResponse *> *)getBot:(AWSLexmodelbuildingserviceGetBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/bots/{name}/versions/{versionoralias}"
                  targetPrefix:@""
                 operationName:@"GetBot"
                   outputClass:[AWSLexmodelbuildingserviceGetBotResponse class]];
}

- (void)getBot:(AWSLexmodelbuildingserviceGetBotRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBotResponse *response, NSError *error))completionHandler {
    [[self getBot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBotResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBotResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBotAliasResponse *> *)getBotAlias:(AWSLexmodelbuildingserviceGetBotAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/bots/{botName}/aliases/{name}"
                  targetPrefix:@""
                 operationName:@"GetBotAlias"
                   outputClass:[AWSLexmodelbuildingserviceGetBotAliasResponse class]];
}

- (void)getBotAlias:(AWSLexmodelbuildingserviceGetBotAliasRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBotAliasResponse *response, NSError *error))completionHandler {
    [[self getBotAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBotAliasResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBotAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBotAliasesResponse *> *)getBotAliases:(AWSLexmodelbuildingserviceGetBotAliasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/bots/{botName}/aliases/"
                  targetPrefix:@""
                 operationName:@"GetBotAliases"
                   outputClass:[AWSLexmodelbuildingserviceGetBotAliasesResponse class]];
}

- (void)getBotAliases:(AWSLexmodelbuildingserviceGetBotAliasesRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBotAliasesResponse *response, NSError *error))completionHandler {
    [[self getBotAliases:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBotAliasesResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBotAliasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBotChannelAssociationResponse *> *)getBotChannelAssociation:(AWSLexmodelbuildingserviceGetBotChannelAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/bots/{botName}/aliases/{aliasName}/channels/{name}"
                  targetPrefix:@""
                 operationName:@"GetBotChannelAssociation"
                   outputClass:[AWSLexmodelbuildingserviceGetBotChannelAssociationResponse class]];
}

- (void)getBotChannelAssociation:(AWSLexmodelbuildingserviceGetBotChannelAssociationRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBotChannelAssociationResponse *response, NSError *error))completionHandler {
    [[self getBotChannelAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBotChannelAssociationResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBotChannelAssociationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse *> *)getBotChannelAssociations:(AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/bots/{botName}/aliases/{aliasName}/channels/"
                  targetPrefix:@""
                 operationName:@"GetBotChannelAssociations"
                   outputClass:[AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse class]];
}

- (void)getBotChannelAssociations:(AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse *response, NSError *error))completionHandler {
    [[self getBotChannelAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBotVersionsResponse *> *)getBotVersions:(AWSLexmodelbuildingserviceGetBotVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/bots/{name}/versions/"
                  targetPrefix:@""
                 operationName:@"GetBotVersions"
                   outputClass:[AWSLexmodelbuildingserviceGetBotVersionsResponse class]];
}

- (void)getBotVersions:(AWSLexmodelbuildingserviceGetBotVersionsRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBotVersionsResponse *response, NSError *error))completionHandler {
    [[self getBotVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBotVersionsResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBotVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBotsResponse *> *)getBots:(AWSLexmodelbuildingserviceGetBotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/bots/"
                  targetPrefix:@""
                 operationName:@"GetBots"
                   outputClass:[AWSLexmodelbuildingserviceGetBotsResponse class]];
}

- (void)getBots:(AWSLexmodelbuildingserviceGetBotsRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBotsResponse *response, NSError *error))completionHandler {
    [[self getBots:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBotsResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBotsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBuiltinIntentResponse *> *)getBuiltinIntent:(AWSLexmodelbuildingserviceGetBuiltinIntentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/builtins/intents/{signature}"
                  targetPrefix:@""
                 operationName:@"GetBuiltinIntent"
                   outputClass:[AWSLexmodelbuildingserviceGetBuiltinIntentResponse class]];
}

- (void)getBuiltinIntent:(AWSLexmodelbuildingserviceGetBuiltinIntentRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBuiltinIntentResponse *response, NSError *error))completionHandler {
    [[self getBuiltinIntent:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBuiltinIntentResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBuiltinIntentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBuiltinIntentsResponse *> *)getBuiltinIntents:(AWSLexmodelbuildingserviceGetBuiltinIntentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/builtins/intents/"
                  targetPrefix:@""
                 operationName:@"GetBuiltinIntents"
                   outputClass:[AWSLexmodelbuildingserviceGetBuiltinIntentsResponse class]];
}

- (void)getBuiltinIntents:(AWSLexmodelbuildingserviceGetBuiltinIntentsRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBuiltinIntentsResponse *response, NSError *error))completionHandler {
    [[self getBuiltinIntents:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBuiltinIntentsResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBuiltinIntentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse *> *)getBuiltinSlotTypes:(AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/builtins/slottypes/"
                  targetPrefix:@""
                 operationName:@"GetBuiltinSlotTypes"
                   outputClass:[AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse class]];
}

- (void)getBuiltinSlotTypes:(AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse *response, NSError *error))completionHandler {
    [[self getBuiltinSlotTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetExportResponse *> *)getExport:(AWSLexmodelbuildingserviceGetExportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/exports/"
                  targetPrefix:@""
                 operationName:@"GetExport"
                   outputClass:[AWSLexmodelbuildingserviceGetExportResponse class]];
}

- (void)getExport:(AWSLexmodelbuildingserviceGetExportRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetExportResponse *response, NSError *error))completionHandler {
    [[self getExport:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetExportResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetExportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetImportResponse *> *)getImport:(AWSLexmodelbuildingserviceGetImportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/imports/{importId}"
                  targetPrefix:@""
                 operationName:@"GetImport"
                   outputClass:[AWSLexmodelbuildingserviceGetImportResponse class]];
}

- (void)getImport:(AWSLexmodelbuildingserviceGetImportRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetImportResponse *response, NSError *error))completionHandler {
    [[self getImport:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetImportResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetImportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetIntentResponse *> *)getIntent:(AWSLexmodelbuildingserviceGetIntentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/intents/{name}/versions/{version}"
                  targetPrefix:@""
                 operationName:@"GetIntent"
                   outputClass:[AWSLexmodelbuildingserviceGetIntentResponse class]];
}

- (void)getIntent:(AWSLexmodelbuildingserviceGetIntentRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetIntentResponse *response, NSError *error))completionHandler {
    [[self getIntent:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetIntentResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetIntentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetIntentVersionsResponse *> *)getIntentVersions:(AWSLexmodelbuildingserviceGetIntentVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/intents/{name}/versions/"
                  targetPrefix:@""
                 operationName:@"GetIntentVersions"
                   outputClass:[AWSLexmodelbuildingserviceGetIntentVersionsResponse class]];
}

- (void)getIntentVersions:(AWSLexmodelbuildingserviceGetIntentVersionsRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetIntentVersionsResponse *response, NSError *error))completionHandler {
    [[self getIntentVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetIntentVersionsResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetIntentVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetIntentsResponse *> *)getIntents:(AWSLexmodelbuildingserviceGetIntentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/intents/"
                  targetPrefix:@""
                 operationName:@"GetIntents"
                   outputClass:[AWSLexmodelbuildingserviceGetIntentsResponse class]];
}

- (void)getIntents:(AWSLexmodelbuildingserviceGetIntentsRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetIntentsResponse *response, NSError *error))completionHandler {
    [[self getIntents:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetIntentsResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetIntentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetSlotTypeResponse *> *)getSlotType:(AWSLexmodelbuildingserviceGetSlotTypeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/slottypes/{name}/versions/{version}"
                  targetPrefix:@""
                 operationName:@"GetSlotType"
                   outputClass:[AWSLexmodelbuildingserviceGetSlotTypeResponse class]];
}

- (void)getSlotType:(AWSLexmodelbuildingserviceGetSlotTypeRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetSlotTypeResponse *response, NSError *error))completionHandler {
    [[self getSlotType:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetSlotTypeResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetSlotTypeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse *> *)getSlotTypeVersions:(AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/slottypes/{name}/versions/"
                  targetPrefix:@""
                 operationName:@"GetSlotTypeVersions"
                   outputClass:[AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse class]];
}

- (void)getSlotTypeVersions:(AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse *response, NSError *error))completionHandler {
    [[self getSlotTypeVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetSlotTypesResponse *> *)getSlotTypes:(AWSLexmodelbuildingserviceGetSlotTypesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/slottypes/"
                  targetPrefix:@""
                 operationName:@"GetSlotTypes"
                   outputClass:[AWSLexmodelbuildingserviceGetSlotTypesResponse class]];
}

- (void)getSlotTypes:(AWSLexmodelbuildingserviceGetSlotTypesRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetSlotTypesResponse *response, NSError *error))completionHandler {
    [[self getSlotTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetSlotTypesResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetSlotTypesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceGetUtterancesViewResponse *> *)getUtterancesView:(AWSLexmodelbuildingserviceGetUtterancesViewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/bots/{botname}/utterances?view=aggregation"
                  targetPrefix:@""
                 operationName:@"GetUtterancesView"
                   outputClass:[AWSLexmodelbuildingserviceGetUtterancesViewResponse class]];
}

- (void)getUtterancesView:(AWSLexmodelbuildingserviceGetUtterancesViewRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceGetUtterancesViewResponse *response, NSError *error))completionHandler {
    [[self getUtterancesView:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceGetUtterancesViewResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceGetUtterancesViewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceListTagsForResourceResponse *> *)listTagsForResource:(AWSLexmodelbuildingserviceListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSLexmodelbuildingserviceListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSLexmodelbuildingserviceListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceListTagsForResourceResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingservicePutBotResponse *> *)putBot:(AWSLexmodelbuildingservicePutBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/bots/{name}/versions/$LATEST"
                  targetPrefix:@""
                 operationName:@"PutBot"
                   outputClass:[AWSLexmodelbuildingservicePutBotResponse class]];
}

- (void)putBot:(AWSLexmodelbuildingservicePutBotRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingservicePutBotResponse *response, NSError *error))completionHandler {
    [[self putBot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingservicePutBotResponse *> * _Nonnull task) {
        AWSLexmodelbuildingservicePutBotResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingservicePutBotAliasResponse *> *)putBotAlias:(AWSLexmodelbuildingservicePutBotAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/bots/{botName}/aliases/{name}"
                  targetPrefix:@""
                 operationName:@"PutBotAlias"
                   outputClass:[AWSLexmodelbuildingservicePutBotAliasResponse class]];
}

- (void)putBotAlias:(AWSLexmodelbuildingservicePutBotAliasRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingservicePutBotAliasResponse *response, NSError *error))completionHandler {
    [[self putBotAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingservicePutBotAliasResponse *> * _Nonnull task) {
        AWSLexmodelbuildingservicePutBotAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingservicePutIntentResponse *> *)putIntent:(AWSLexmodelbuildingservicePutIntentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/intents/{name}/versions/$LATEST"
                  targetPrefix:@""
                 operationName:@"PutIntent"
                   outputClass:[AWSLexmodelbuildingservicePutIntentResponse class]];
}

- (void)putIntent:(AWSLexmodelbuildingservicePutIntentRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingservicePutIntentResponse *response, NSError *error))completionHandler {
    [[self putIntent:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingservicePutIntentResponse *> * _Nonnull task) {
        AWSLexmodelbuildingservicePutIntentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingservicePutSlotTypeResponse *> *)putSlotType:(AWSLexmodelbuildingservicePutSlotTypeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/slottypes/{name}/versions/$LATEST"
                  targetPrefix:@""
                 operationName:@"PutSlotType"
                   outputClass:[AWSLexmodelbuildingservicePutSlotTypeResponse class]];
}

- (void)putSlotType:(AWSLexmodelbuildingservicePutSlotTypeRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingservicePutSlotTypeResponse *response, NSError *error))completionHandler {
    [[self putSlotType:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingservicePutSlotTypeResponse *> * _Nonnull task) {
        AWSLexmodelbuildingservicePutSlotTypeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceStartImportResponse *> *)startImport:(AWSLexmodelbuildingserviceStartImportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/imports/"
                  targetPrefix:@""
                 operationName:@"StartImport"
                   outputClass:[AWSLexmodelbuildingserviceStartImportResponse class]];
}

- (void)startImport:(AWSLexmodelbuildingserviceStartImportRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceStartImportResponse *response, NSError *error))completionHandler {
    [[self startImport:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceStartImportResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceStartImportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceTagResourceResponse *> *)tagResource:(AWSLexmodelbuildingserviceTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSLexmodelbuildingserviceTagResourceResponse class]];
}

- (void)tagResource:(AWSLexmodelbuildingserviceTagResourceRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceTagResourceResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLexmodelbuildingserviceUntagResourceResponse *> *)untagResource:(AWSLexmodelbuildingserviceUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSLexmodelbuildingserviceUntagResourceResponse class]];
}

- (void)untagResource:(AWSLexmodelbuildingserviceUntagResourceRequest *)request
     completionHandler:(void (^)(AWSLexmodelbuildingserviceUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSLexmodelbuildingserviceUntagResourceResponse *> * _Nonnull task) {
        AWSLexmodelbuildingserviceUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
