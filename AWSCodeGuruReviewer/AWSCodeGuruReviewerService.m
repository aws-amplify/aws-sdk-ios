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

#import "AWSCodeGuruReviewerService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSCodeGuruReviewerResources.h"

static NSString *const AWSInfoCodeGuruReviewer = @"CodeGuruReviewer";
NSString *const AWSCodeGuruReviewerSDKVersion = @"2.13.3";


@interface AWSCodeGuruReviewerResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSCodeGuruReviewerResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSCodeGuruReviewerErrorAccessDenied),
                            @"ConflictException" : @(AWSCodeGuruReviewerErrorConflict),
                            @"InternalServerException" : @(AWSCodeGuruReviewerErrorInternalServer),
                            @"NotFoundException" : @(AWSCodeGuruReviewerErrorNotFound),
                            @"ResourceNotFoundException" : @(AWSCodeGuruReviewerErrorResourceNotFound),
                            @"ThrottlingException" : @(AWSCodeGuruReviewerErrorThrottling),
                            @"ValidationException" : @(AWSCodeGuruReviewerErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSCodeGuruReviewerErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSCodeGuruReviewerErrorDomain
                                                 code:AWSCodeGuruReviewerErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSCodeGuruReviewerErrorDomain
                                     code:AWSCodeGuruReviewerErrorUnknown
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

@interface AWSCodeGuruReviewerRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCodeGuruReviewerRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCodeGuruReviewer()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCodeGuruReviewer

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSCodeGuruReviewerSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSCodeGuruReviewer versions need to match. Check your SDK installation. AWSCore: %@ AWSCodeGuruReviewer: %@", AWSiOSSDKVersion, AWSCodeGuruReviewerSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCodeGuruReviewer {
    static AWSCodeGuruReviewer *_defaultCodeGuruReviewer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCodeGuruReviewer];
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
        _defaultCodeGuruReviewer = [[AWSCodeGuruReviewer alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCodeGuruReviewer;
}

+ (void)registerCodeGuruReviewerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCodeGuruReviewer alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CodeGuruReviewerForKey:(NSString *)key {
    @synchronized(self) {
        AWSCodeGuruReviewer *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCodeGuruReviewer
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCodeGuruReviewerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCodeGuruReviewer` or `+ CodeGuruReviewerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCodeGuruReviewer
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCodeGuruReviewer];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCodeGuruReviewerRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSCodeGuruReviewerResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCodeGuruReviewerResponseSerializer alloc] initWithJSONDefinition:[[AWSCodeGuruReviewerResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSCodeGuruReviewerAssociateRepositoryResponse *> *)associateRepository:(AWSCodeGuruReviewerAssociateRepositoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/associations"
                  targetPrefix:@""
                 operationName:@"AssociateRepository"
                   outputClass:[AWSCodeGuruReviewerAssociateRepositoryResponse class]];
}

- (void)associateRepository:(AWSCodeGuruReviewerAssociateRepositoryRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerAssociateRepositoryResponse *response, NSError *error))completionHandler {
    [[self associateRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerAssociateRepositoryResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerAssociateRepositoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeGuruReviewerDescribeCodeReviewResponse *> *)describeCodeReview:(AWSCodeGuruReviewerDescribeCodeReviewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/codereviews/{CodeReviewArn}"
                  targetPrefix:@""
                 operationName:@"DescribeCodeReview"
                   outputClass:[AWSCodeGuruReviewerDescribeCodeReviewResponse class]];
}

- (void)describeCodeReview:(AWSCodeGuruReviewerDescribeCodeReviewRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerDescribeCodeReviewResponse *response, NSError *error))completionHandler {
    [[self describeCodeReview:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerDescribeCodeReviewResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerDescribeCodeReviewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse *> *)describeRecommendationFeedback:(AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/feedback/{CodeReviewArn}"
                  targetPrefix:@""
                 operationName:@"DescribeRecommendationFeedback"
                   outputClass:[AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse class]];
}

- (void)describeRecommendationFeedback:(AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse *response, NSError *error))completionHandler {
    [[self describeRecommendationFeedback:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeGuruReviewerDescribeRepositoryAssociationResponse *> *)describeRepositoryAssociation:(AWSCodeGuruReviewerDescribeRepositoryAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/associations/{AssociationArn}"
                  targetPrefix:@""
                 operationName:@"DescribeRepositoryAssociation"
                   outputClass:[AWSCodeGuruReviewerDescribeRepositoryAssociationResponse class]];
}

- (void)describeRepositoryAssociation:(AWSCodeGuruReviewerDescribeRepositoryAssociationRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerDescribeRepositoryAssociationResponse *response, NSError *error))completionHandler {
    [[self describeRepositoryAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerDescribeRepositoryAssociationResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerDescribeRepositoryAssociationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeGuruReviewerDisassociateRepositoryResponse *> *)disassociateRepository:(AWSCodeGuruReviewerDisassociateRepositoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/associations/{AssociationArn}"
                  targetPrefix:@""
                 operationName:@"DisassociateRepository"
                   outputClass:[AWSCodeGuruReviewerDisassociateRepositoryResponse class]];
}

- (void)disassociateRepository:(AWSCodeGuruReviewerDisassociateRepositoryRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerDisassociateRepositoryResponse *response, NSError *error))completionHandler {
    [[self disassociateRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerDisassociateRepositoryResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerDisassociateRepositoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeGuruReviewerListCodeReviewsResponse *> *)listCodeReviews:(AWSCodeGuruReviewerListCodeReviewsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/codereviews"
                  targetPrefix:@""
                 operationName:@"ListCodeReviews"
                   outputClass:[AWSCodeGuruReviewerListCodeReviewsResponse class]];
}

- (void)listCodeReviews:(AWSCodeGuruReviewerListCodeReviewsRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerListCodeReviewsResponse *response, NSError *error))completionHandler {
    [[self listCodeReviews:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerListCodeReviewsResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerListCodeReviewsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeGuruReviewerListRecommendationFeedbackResponse *> *)listRecommendationFeedback:(AWSCodeGuruReviewerListRecommendationFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/feedback/{CodeReviewArn}/RecommendationFeedback"
                  targetPrefix:@""
                 operationName:@"ListRecommendationFeedback"
                   outputClass:[AWSCodeGuruReviewerListRecommendationFeedbackResponse class]];
}

- (void)listRecommendationFeedback:(AWSCodeGuruReviewerListRecommendationFeedbackRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerListRecommendationFeedbackResponse *response, NSError *error))completionHandler {
    [[self listRecommendationFeedback:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerListRecommendationFeedbackResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerListRecommendationFeedbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeGuruReviewerListRecommendationsResponse *> *)listRecommendations:(AWSCodeGuruReviewerListRecommendationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/codereviews/{CodeReviewArn}/Recommendations"
                  targetPrefix:@""
                 operationName:@"ListRecommendations"
                   outputClass:[AWSCodeGuruReviewerListRecommendationsResponse class]];
}

- (void)listRecommendations:(AWSCodeGuruReviewerListRecommendationsRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerListRecommendationsResponse *response, NSError *error))completionHandler {
    [[self listRecommendations:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerListRecommendationsResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerListRecommendationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeGuruReviewerListRepositoryAssociationsResponse *> *)listRepositoryAssociations:(AWSCodeGuruReviewerListRepositoryAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/associations"
                  targetPrefix:@""
                 operationName:@"ListRepositoryAssociations"
                   outputClass:[AWSCodeGuruReviewerListRepositoryAssociationsResponse class]];
}

- (void)listRepositoryAssociations:(AWSCodeGuruReviewerListRepositoryAssociationsRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerListRepositoryAssociationsResponse *response, NSError *error))completionHandler {
    [[self listRepositoryAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerListRepositoryAssociationsResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerListRepositoryAssociationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCodeGuruReviewerPutRecommendationFeedbackResponse *> *)putRecommendationFeedback:(AWSCodeGuruReviewerPutRecommendationFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/feedback"
                  targetPrefix:@""
                 operationName:@"PutRecommendationFeedback"
                   outputClass:[AWSCodeGuruReviewerPutRecommendationFeedbackResponse class]];
}

- (void)putRecommendationFeedback:(AWSCodeGuruReviewerPutRecommendationFeedbackRequest *)request
     completionHandler:(void (^)(AWSCodeGuruReviewerPutRecommendationFeedbackResponse *response, NSError *error))completionHandler {
    [[self putRecommendationFeedback:request] continueWithBlock:^id _Nullable(AWSTask<AWSCodeGuruReviewerPutRecommendationFeedbackResponse *> * _Nonnull task) {
        AWSCodeGuruReviewerPutRecommendationFeedbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
