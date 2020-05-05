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

#import "AWSAWSSupportService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAWSSupportResources.h"

static NSString *const AWSInfoAWSSupport = @"AWSSupport";
NSString *const AWSAWSSupportSDKVersion = @"2.13.3";


@interface AWSAWSSupportResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSAWSSupportResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AttachmentIdNotFound" : @(AWSAWSSupportErrorAttachmentIdNotFound),
                            @"AttachmentLimitExceeded" : @(AWSAWSSupportErrorAttachmentLimitExceeded),
                            @"AttachmentSetExpired" : @(AWSAWSSupportErrorAttachmentSetExpired),
                            @"AttachmentSetIdNotFound" : @(AWSAWSSupportErrorAttachmentSetIdNotFound),
                            @"AttachmentSetSizeLimitExceeded" : @(AWSAWSSupportErrorAttachmentSetSizeLimitExceeded),
                            @"CaseCreationLimitExceeded" : @(AWSAWSSupportErrorCaseCreationLimitExceeded),
                            @"CaseIdNotFound" : @(AWSAWSSupportErrorCaseIdNotFound),
                            @"DescribeAttachmentLimitExceeded" : @(AWSAWSSupportErrorDescribeAttachmentLimitExceeded),
                            @"InternalServerError" : @(AWSAWSSupportErrorInternalServer),
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
	                *error = [NSError errorWithDomain:AWSAWSSupportErrorDomain
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
        *error = [NSError errorWithDomain:AWSAWSSupportErrorDomain
                                     code:AWSAWSSupportErrorUnknown
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

@interface AWSAWSSupportRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAWSSupportRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAWSSupport()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAWSSupport

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAWSSupportSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAWSSupport versions need to match. Check your SDK installation. AWSCore: %@ AWSAWSSupport: %@", AWSiOSSDKVersion, AWSAWSSupportSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAWSSupport {
    static AWSAWSSupport *_defaultAWSSupport = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAWSSupport];
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
        _defaultAWSSupport = [[AWSAWSSupport alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAWSSupport;
}

+ (void)registerAWSSupportWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAWSSupport alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AWSSupportForKey:(NSString *)key {
    @synchronized(self) {
        AWSAWSSupport *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAWSSupport
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAWSSupport registerAWSSupportWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAWSSupportForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAWSSupport` or `+ AWSSupportForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAWSSupport
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAWSSupport];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAWSSupportRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSAWSSupportResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAWSSupportResponseSerializer alloc] initWithJSONDefinition:[[AWSAWSSupportResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSAWSSupportAddAttachmentsToSetResponse *> *)addAttachmentsToSet:(AWSAWSSupportAddAttachmentsToSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"AddAttachmentsToSet"
                   outputClass:[AWSAWSSupportAddAttachmentsToSetResponse class]];
}

- (void)addAttachmentsToSet:(AWSAWSSupportAddAttachmentsToSetRequest *)request
     completionHandler:(void (^)(AWSAWSSupportAddAttachmentsToSetResponse *response, NSError *error))completionHandler {
    [[self addAttachmentsToSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportAddAttachmentsToSetResponse *> * _Nonnull task) {
        AWSAWSSupportAddAttachmentsToSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportAddCommunicationToCaseResponse *> *)addCommunicationToCase:(AWSAWSSupportAddCommunicationToCaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"AddCommunicationToCase"
                   outputClass:[AWSAWSSupportAddCommunicationToCaseResponse class]];
}

- (void)addCommunicationToCase:(AWSAWSSupportAddCommunicationToCaseRequest *)request
     completionHandler:(void (^)(AWSAWSSupportAddCommunicationToCaseResponse *response, NSError *error))completionHandler {
    [[self addCommunicationToCase:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportAddCommunicationToCaseResponse *> * _Nonnull task) {
        AWSAWSSupportAddCommunicationToCaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportCreateCaseResponse *> *)createCase:(AWSAWSSupportCreateCaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"CreateCase"
                   outputClass:[AWSAWSSupportCreateCaseResponse class]];
}

- (void)createCase:(AWSAWSSupportCreateCaseRequest *)request
     completionHandler:(void (^)(AWSAWSSupportCreateCaseResponse *response, NSError *error))completionHandler {
    [[self createCase:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportCreateCaseResponse *> * _Nonnull task) {
        AWSAWSSupportCreateCaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportDescribeAttachmentResponse *> *)describeAttachment:(AWSAWSSupportDescribeAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeAttachment"
                   outputClass:[AWSAWSSupportDescribeAttachmentResponse class]];
}

- (void)describeAttachment:(AWSAWSSupportDescribeAttachmentRequest *)request
     completionHandler:(void (^)(AWSAWSSupportDescribeAttachmentResponse *response, NSError *error))completionHandler {
    [[self describeAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportDescribeAttachmentResponse *> * _Nonnull task) {
        AWSAWSSupportDescribeAttachmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportDescribeCasesResponse *> *)describeCases:(AWSAWSSupportDescribeCasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeCases"
                   outputClass:[AWSAWSSupportDescribeCasesResponse class]];
}

- (void)describeCases:(AWSAWSSupportDescribeCasesRequest *)request
     completionHandler:(void (^)(AWSAWSSupportDescribeCasesResponse *response, NSError *error))completionHandler {
    [[self describeCases:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportDescribeCasesResponse *> * _Nonnull task) {
        AWSAWSSupportDescribeCasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportDescribeCommunicationsResponse *> *)describeCommunications:(AWSAWSSupportDescribeCommunicationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeCommunications"
                   outputClass:[AWSAWSSupportDescribeCommunicationsResponse class]];
}

- (void)describeCommunications:(AWSAWSSupportDescribeCommunicationsRequest *)request
     completionHandler:(void (^)(AWSAWSSupportDescribeCommunicationsResponse *response, NSError *error))completionHandler {
    [[self describeCommunications:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportDescribeCommunicationsResponse *> * _Nonnull task) {
        AWSAWSSupportDescribeCommunicationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportDescribeServicesResponse *> *)describeServices:(AWSAWSSupportDescribeServicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeServices"
                   outputClass:[AWSAWSSupportDescribeServicesResponse class]];
}

- (void)describeServices:(AWSAWSSupportDescribeServicesRequest *)request
     completionHandler:(void (^)(AWSAWSSupportDescribeServicesResponse *response, NSError *error))completionHandler {
    [[self describeServices:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportDescribeServicesResponse *> * _Nonnull task) {
        AWSAWSSupportDescribeServicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportDescribeSeverityLevelsResponse *> *)describeSeverityLevels:(AWSAWSSupportDescribeSeverityLevelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeSeverityLevels"
                   outputClass:[AWSAWSSupportDescribeSeverityLevelsResponse class]];
}

- (void)describeSeverityLevels:(AWSAWSSupportDescribeSeverityLevelsRequest *)request
     completionHandler:(void (^)(AWSAWSSupportDescribeSeverityLevelsResponse *response, NSError *error))completionHandler {
    [[self describeSeverityLevels:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportDescribeSeverityLevelsResponse *> * _Nonnull task) {
        AWSAWSSupportDescribeSeverityLevelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *> *)describeTrustedAdvisorCheckRefreshStatuses:(AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeTrustedAdvisorCheckRefreshStatuses"
                   outputClass:[AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse class]];
}

- (void)describeTrustedAdvisorCheckRefreshStatuses:(AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest *)request
     completionHandler:(void (^)(AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *response, NSError *error))completionHandler {
    [[self describeTrustedAdvisorCheckRefreshStatuses:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *> * _Nonnull task) {
        AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse *> *)describeTrustedAdvisorCheckResult:(AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeTrustedAdvisorCheckResult"
                   outputClass:[AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse class]];
}

- (void)describeTrustedAdvisorCheckResult:(AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest *)request
     completionHandler:(void (^)(AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse *response, NSError *error))completionHandler {
    [[self describeTrustedAdvisorCheckResult:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse *> * _Nonnull task) {
        AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse *> *)describeTrustedAdvisorCheckSummaries:(AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeTrustedAdvisorCheckSummaries"
                   outputClass:[AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse class]];
}

- (void)describeTrustedAdvisorCheckSummaries:(AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest *)request
     completionHandler:(void (^)(AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse *response, NSError *error))completionHandler {
    [[self describeTrustedAdvisorCheckSummaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse *> * _Nonnull task) {
        AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportDescribeTrustedAdvisorChecksResponse *> *)describeTrustedAdvisorChecks:(AWSAWSSupportDescribeTrustedAdvisorChecksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeTrustedAdvisorChecks"
                   outputClass:[AWSAWSSupportDescribeTrustedAdvisorChecksResponse class]];
}

- (void)describeTrustedAdvisorChecks:(AWSAWSSupportDescribeTrustedAdvisorChecksRequest *)request
     completionHandler:(void (^)(AWSAWSSupportDescribeTrustedAdvisorChecksResponse *response, NSError *error))completionHandler {
    [[self describeTrustedAdvisorChecks:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportDescribeTrustedAdvisorChecksResponse *> * _Nonnull task) {
        AWSAWSSupportDescribeTrustedAdvisorChecksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportRefreshTrustedAdvisorCheckResponse *> *)refreshTrustedAdvisorCheck:(AWSAWSSupportRefreshTrustedAdvisorCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"RefreshTrustedAdvisorCheck"
                   outputClass:[AWSAWSSupportRefreshTrustedAdvisorCheckResponse class]];
}

- (void)refreshTrustedAdvisorCheck:(AWSAWSSupportRefreshTrustedAdvisorCheckRequest *)request
     completionHandler:(void (^)(AWSAWSSupportRefreshTrustedAdvisorCheckResponse *response, NSError *error))completionHandler {
    [[self refreshTrustedAdvisorCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportRefreshTrustedAdvisorCheckResponse *> * _Nonnull task) {
        AWSAWSSupportRefreshTrustedAdvisorCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSSupportResolveCaseResponse *> *)resolveCase:(AWSAWSSupportResolveCaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"ResolveCase"
                   outputClass:[AWSAWSSupportResolveCaseResponse class]];
}

- (void)resolveCase:(AWSAWSSupportResolveCaseRequest *)request
     completionHandler:(void (^)(AWSAWSSupportResolveCaseResponse *response, NSError *error))completionHandler {
    [[self resolveCase:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSSupportResolveCaseResponse *> * _Nonnull task) {
        AWSAWSSupportResolveCaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
