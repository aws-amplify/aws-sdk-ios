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

#import "AWScodeguru-reviewerService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWScodeguru-reviewerResources.h"

static NSString *const AWSInfocodeguru-reviewer = @"codeguru-reviewer";
NSString *const AWScodeguru-reviewerSDKVersion = @"2.13.2";


@interface AWScodeguru-reviewerResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWScodeguru-reviewerResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWScodeguru-reviewerErrorAccessDenied),
                            @"ConflictException" : @(AWScodeguru-reviewerErrorConflict),
                            @"InternalServerException" : @(AWScodeguru-reviewerErrorInternalServer),
                            @"NotFoundException" : @(AWScodeguru-reviewerErrorNotFound),
                            @"ResourceNotFoundException" : @(AWScodeguru-reviewerErrorResourceNotFound),
                            @"ThrottlingException" : @(AWScodeguru-reviewerErrorThrottling),
                            @"ValidationException" : @(AWScodeguru-reviewerErrorValidation),
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
                    *error = [NSError errorWithDomain:AWScodeguru-reviewerErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWScodeguru-reviewerErrorDomain
                                                 code:AWScodeguru-reviewerErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWScodeguru-reviewerErrorDomain
                                     code:AWScodeguru-reviewerErrorUnknown
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

@interface AWScodeguru-reviewerRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWScodeguru-reviewerRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWScodeguru-reviewer()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWScodeguru-reviewer

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWScodeguru-reviewerSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWScodeguru-reviewer versions need to match. Check your SDK installation. AWSCore: %@ AWScodeguru-reviewer: %@", AWSiOSSDKVersion, AWScodeguru-reviewerSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultcodeguru-reviewer {
    static AWScodeguru-reviewer *_defaultcodeguru-reviewer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfocodeguru-reviewer];
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
        _defaultcodeguru-reviewer = [[AWScodeguru-reviewer alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultcodeguru-reviewer;
}

+ (void)registercodeguru-reviewerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWScodeguru-reviewer alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)codeguru-reviewerForKey:(NSString *)key {
    @synchronized(self) {
        AWScodeguru-reviewer *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfocodeguru-reviewer
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removecodeguru-reviewerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultcodeguru-reviewer` or `+ codeguru-reviewerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicecodeguru-reviewer
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicecodeguru-reviewer];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWScodeguru-reviewerRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWScodeguru-reviewerResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWScodeguru-reviewerResponseSerializer alloc] initWithJSONDefinition:[[AWScodeguru-reviewerResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWScodeguru-reviewerAssociateRepositoryResponse *> *)associateRepository:(AWScodeguru-reviewerAssociateRepositoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/associations"
                  targetPrefix:@""
                 operationName:@"AssociateRepository"
                   outputClass:[AWScodeguru-reviewerAssociateRepositoryResponse class]];
}

- (void)associateRepository:(AWScodeguru-reviewerAssociateRepositoryRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerAssociateRepositoryResponse *response, NSError *error))completionHandler {
    [[self associateRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerAssociateRepositoryResponse *> * _Nonnull task) {
        AWScodeguru-reviewerAssociateRepositoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWScodeguru-reviewerDescribeCodeReviewResponse *> *)describeCodeReview:(AWScodeguru-reviewerDescribeCodeReviewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/codereviews/{CodeReviewArn}"
                  targetPrefix:@""
                 operationName:@"DescribeCodeReview"
                   outputClass:[AWScodeguru-reviewerDescribeCodeReviewResponse class]];
}

- (void)describeCodeReview:(AWScodeguru-reviewerDescribeCodeReviewRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerDescribeCodeReviewResponse *response, NSError *error))completionHandler {
    [[self describeCodeReview:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerDescribeCodeReviewResponse *> * _Nonnull task) {
        AWScodeguru-reviewerDescribeCodeReviewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWScodeguru-reviewerDescribeRecommendationFeedbackResponse *> *)describeRecommendationFeedback:(AWScodeguru-reviewerDescribeRecommendationFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/feedback/{CodeReviewArn}"
                  targetPrefix:@""
                 operationName:@"DescribeRecommendationFeedback"
                   outputClass:[AWScodeguru-reviewerDescribeRecommendationFeedbackResponse class]];
}

- (void)describeRecommendationFeedback:(AWScodeguru-reviewerDescribeRecommendationFeedbackRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerDescribeRecommendationFeedbackResponse *response, NSError *error))completionHandler {
    [[self describeRecommendationFeedback:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerDescribeRecommendationFeedbackResponse *> * _Nonnull task) {
        AWScodeguru-reviewerDescribeRecommendationFeedbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWScodeguru-reviewerDescribeRepositoryAssociationResponse *> *)describeRepositoryAssociation:(AWScodeguru-reviewerDescribeRepositoryAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/associations/{AssociationArn}"
                  targetPrefix:@""
                 operationName:@"DescribeRepositoryAssociation"
                   outputClass:[AWScodeguru-reviewerDescribeRepositoryAssociationResponse class]];
}

- (void)describeRepositoryAssociation:(AWScodeguru-reviewerDescribeRepositoryAssociationRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerDescribeRepositoryAssociationResponse *response, NSError *error))completionHandler {
    [[self describeRepositoryAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerDescribeRepositoryAssociationResponse *> * _Nonnull task) {
        AWScodeguru-reviewerDescribeRepositoryAssociationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWScodeguru-reviewerDisassociateRepositoryResponse *> *)disassociateRepository:(AWScodeguru-reviewerDisassociateRepositoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/associations/{AssociationArn}"
                  targetPrefix:@""
                 operationName:@"DisassociateRepository"
                   outputClass:[AWScodeguru-reviewerDisassociateRepositoryResponse class]];
}

- (void)disassociateRepository:(AWScodeguru-reviewerDisassociateRepositoryRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerDisassociateRepositoryResponse *response, NSError *error))completionHandler {
    [[self disassociateRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerDisassociateRepositoryResponse *> * _Nonnull task) {
        AWScodeguru-reviewerDisassociateRepositoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWScodeguru-reviewerListCodeReviewsResponse *> *)listCodeReviews:(AWScodeguru-reviewerListCodeReviewsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/codereviews"
                  targetPrefix:@""
                 operationName:@"ListCodeReviews"
                   outputClass:[AWScodeguru-reviewerListCodeReviewsResponse class]];
}

- (void)listCodeReviews:(AWScodeguru-reviewerListCodeReviewsRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerListCodeReviewsResponse *response, NSError *error))completionHandler {
    [[self listCodeReviews:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerListCodeReviewsResponse *> * _Nonnull task) {
        AWScodeguru-reviewerListCodeReviewsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWScodeguru-reviewerListRecommendationFeedbackResponse *> *)listRecommendationFeedback:(AWScodeguru-reviewerListRecommendationFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/feedback/{CodeReviewArn}/RecommendationFeedback"
                  targetPrefix:@""
                 operationName:@"ListRecommendationFeedback"
                   outputClass:[AWScodeguru-reviewerListRecommendationFeedbackResponse class]];
}

- (void)listRecommendationFeedback:(AWScodeguru-reviewerListRecommendationFeedbackRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerListRecommendationFeedbackResponse *response, NSError *error))completionHandler {
    [[self listRecommendationFeedback:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerListRecommendationFeedbackResponse *> * _Nonnull task) {
        AWScodeguru-reviewerListRecommendationFeedbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWScodeguru-reviewerListRecommendationsResponse *> *)listRecommendations:(AWScodeguru-reviewerListRecommendationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/codereviews/{CodeReviewArn}/Recommendations"
                  targetPrefix:@""
                 operationName:@"ListRecommendations"
                   outputClass:[AWScodeguru-reviewerListRecommendationsResponse class]];
}

- (void)listRecommendations:(AWScodeguru-reviewerListRecommendationsRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerListRecommendationsResponse *response, NSError *error))completionHandler {
    [[self listRecommendations:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerListRecommendationsResponse *> * _Nonnull task) {
        AWScodeguru-reviewerListRecommendationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWScodeguru-reviewerListRepositoryAssociationsResponse *> *)listRepositoryAssociations:(AWScodeguru-reviewerListRepositoryAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/associations"
                  targetPrefix:@""
                 operationName:@"ListRepositoryAssociations"
                   outputClass:[AWScodeguru-reviewerListRepositoryAssociationsResponse class]];
}

- (void)listRepositoryAssociations:(AWScodeguru-reviewerListRepositoryAssociationsRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerListRepositoryAssociationsResponse *response, NSError *error))completionHandler {
    [[self listRepositoryAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerListRepositoryAssociationsResponse *> * _Nonnull task) {
        AWScodeguru-reviewerListRepositoryAssociationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWScodeguru-reviewerPutRecommendationFeedbackResponse *> *)putRecommendationFeedback:(AWScodeguru-reviewerPutRecommendationFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/feedback"
                  targetPrefix:@""
                 operationName:@"PutRecommendationFeedback"
                   outputClass:[AWScodeguru-reviewerPutRecommendationFeedbackResponse class]];
}

- (void)putRecommendationFeedback:(AWScodeguru-reviewerPutRecommendationFeedbackRequest *)request
     completionHandler:(void (^)(AWScodeguru-reviewerPutRecommendationFeedbackResponse *response, NSError *error))completionHandler {
    [[self putRecommendationFeedback:request] continueWithBlock:^id _Nullable(AWSTask<AWScodeguru-reviewerPutRecommendationFeedbackResponse *> * _Nonnull task) {
        AWScodeguru-reviewerPutRecommendationFeedbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
