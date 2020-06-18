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

#import "AWSSupportService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSupportResources.h"

static NSString *const AWSInfoSupport = @"Support";
NSString *const AWSSupportSDKVersion = @"2.13.4";


@interface AWSSupportResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSupportResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AttachmentIdNotFound" : @(AWSSupportErrorAttachmentIdNotFound),
                            @"AttachmentLimitExceeded" : @(AWSSupportErrorAttachmentLimitExceeded),
                            @"AttachmentSetExpired" : @(AWSSupportErrorAttachmentSetExpired),
                            @"AttachmentSetIdNotFound" : @(AWSSupportErrorAttachmentSetIdNotFound),
                            @"AttachmentSetSizeLimitExceeded" : @(AWSSupportErrorAttachmentSetSizeLimitExceeded),
                            @"CaseCreationLimitExceeded" : @(AWSSupportErrorCaseCreationLimitExceeded),
                            @"CaseIdNotFound" : @(AWSSupportErrorCaseIdNotFound),
                            @"DescribeAttachmentLimitExceeded" : @(AWSSupportErrorDescribeAttachmentLimitExceeded),
                            @"InternalServerError" : @(AWSSupportErrorInternalServer),
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
	                *error = [NSError errorWithDomain:AWSSupportErrorDomain
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
        *error = [NSError errorWithDomain:AWSSupportErrorDomain
                                     code:AWSSupportErrorUnknown
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

@interface AWSSupportRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSupportRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSupport()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSupport

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSupportSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSupport versions need to match. Check your SDK installation. AWSCore: %@ AWSSupport: %@", AWSiOSSDKVersion, AWSSupportSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSupport {
    static AWSSupport *_defaultSupport = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSupport];
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
        _defaultSupport = [[AWSSupport alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSupport;
}

+ (void)registerSupportWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSupport alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SupportForKey:(NSString *)key {
    @synchronized(self) {
        AWSSupport *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSupport
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSupport registerSupportWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSupportForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSupport` or `+ SupportForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSupport
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSupport];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSupportRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSupportResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSupportResponseSerializer alloc] initWithJSONDefinition:[[AWSSupportResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSupportAddAttachmentsToSetResponse *> *)addAttachmentsToSet:(AWSSupportAddAttachmentsToSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"AddAttachmentsToSet"
                   outputClass:[AWSSupportAddAttachmentsToSetResponse class]];
}

- (void)addAttachmentsToSet:(AWSSupportAddAttachmentsToSetRequest *)request
     completionHandler:(void (^)(AWSSupportAddAttachmentsToSetResponse *response, NSError *error))completionHandler {
    [[self addAttachmentsToSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportAddAttachmentsToSetResponse *> * _Nonnull task) {
        AWSSupportAddAttachmentsToSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportAddCommunicationToCaseResponse *> *)addCommunicationToCase:(AWSSupportAddCommunicationToCaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"AddCommunicationToCase"
                   outputClass:[AWSSupportAddCommunicationToCaseResponse class]];
}

- (void)addCommunicationToCase:(AWSSupportAddCommunicationToCaseRequest *)request
     completionHandler:(void (^)(AWSSupportAddCommunicationToCaseResponse *response, NSError *error))completionHandler {
    [[self addCommunicationToCase:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportAddCommunicationToCaseResponse *> * _Nonnull task) {
        AWSSupportAddCommunicationToCaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportCreateCaseResponse *> *)createCase:(AWSSupportCreateCaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"CreateCase"
                   outputClass:[AWSSupportCreateCaseResponse class]];
}

- (void)createCase:(AWSSupportCreateCaseRequest *)request
     completionHandler:(void (^)(AWSSupportCreateCaseResponse *response, NSError *error))completionHandler {
    [[self createCase:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportCreateCaseResponse *> * _Nonnull task) {
        AWSSupportCreateCaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportDescribeAttachmentResponse *> *)describeAttachment:(AWSSupportDescribeAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeAttachment"
                   outputClass:[AWSSupportDescribeAttachmentResponse class]];
}

- (void)describeAttachment:(AWSSupportDescribeAttachmentRequest *)request
     completionHandler:(void (^)(AWSSupportDescribeAttachmentResponse *response, NSError *error))completionHandler {
    [[self describeAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportDescribeAttachmentResponse *> * _Nonnull task) {
        AWSSupportDescribeAttachmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportDescribeCasesResponse *> *)describeCases:(AWSSupportDescribeCasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeCases"
                   outputClass:[AWSSupportDescribeCasesResponse class]];
}

- (void)describeCases:(AWSSupportDescribeCasesRequest *)request
     completionHandler:(void (^)(AWSSupportDescribeCasesResponse *response, NSError *error))completionHandler {
    [[self describeCases:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportDescribeCasesResponse *> * _Nonnull task) {
        AWSSupportDescribeCasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportDescribeCommunicationsResponse *> *)describeCommunications:(AWSSupportDescribeCommunicationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeCommunications"
                   outputClass:[AWSSupportDescribeCommunicationsResponse class]];
}

- (void)describeCommunications:(AWSSupportDescribeCommunicationsRequest *)request
     completionHandler:(void (^)(AWSSupportDescribeCommunicationsResponse *response, NSError *error))completionHandler {
    [[self describeCommunications:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportDescribeCommunicationsResponse *> * _Nonnull task) {
        AWSSupportDescribeCommunicationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportDescribeServicesResponse *> *)describeServices:(AWSSupportDescribeServicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeServices"
                   outputClass:[AWSSupportDescribeServicesResponse class]];
}

- (void)describeServices:(AWSSupportDescribeServicesRequest *)request
     completionHandler:(void (^)(AWSSupportDescribeServicesResponse *response, NSError *error))completionHandler {
    [[self describeServices:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportDescribeServicesResponse *> * _Nonnull task) {
        AWSSupportDescribeServicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportDescribeSeverityLevelsResponse *> *)describeSeverityLevels:(AWSSupportDescribeSeverityLevelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeSeverityLevels"
                   outputClass:[AWSSupportDescribeSeverityLevelsResponse class]];
}

- (void)describeSeverityLevels:(AWSSupportDescribeSeverityLevelsRequest *)request
     completionHandler:(void (^)(AWSSupportDescribeSeverityLevelsResponse *response, NSError *error))completionHandler {
    [[self describeSeverityLevels:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportDescribeSeverityLevelsResponse *> * _Nonnull task) {
        AWSSupportDescribeSeverityLevelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *> *)describeTrustedAdvisorCheckRefreshStatuses:(AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeTrustedAdvisorCheckRefreshStatuses"
                   outputClass:[AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse class]];
}

- (void)describeTrustedAdvisorCheckRefreshStatuses:(AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest *)request
     completionHandler:(void (^)(AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *response, NSError *error))completionHandler {
    [[self describeTrustedAdvisorCheckRefreshStatuses:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *> * _Nonnull task) {
        AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportDescribeTrustedAdvisorCheckResultResponse *> *)describeTrustedAdvisorCheckResult:(AWSSupportDescribeTrustedAdvisorCheckResultRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeTrustedAdvisorCheckResult"
                   outputClass:[AWSSupportDescribeTrustedAdvisorCheckResultResponse class]];
}

- (void)describeTrustedAdvisorCheckResult:(AWSSupportDescribeTrustedAdvisorCheckResultRequest *)request
     completionHandler:(void (^)(AWSSupportDescribeTrustedAdvisorCheckResultResponse *response, NSError *error))completionHandler {
    [[self describeTrustedAdvisorCheckResult:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportDescribeTrustedAdvisorCheckResultResponse *> * _Nonnull task) {
        AWSSupportDescribeTrustedAdvisorCheckResultResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportDescribeTrustedAdvisorCheckSummariesResponse *> *)describeTrustedAdvisorCheckSummaries:(AWSSupportDescribeTrustedAdvisorCheckSummariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeTrustedAdvisorCheckSummaries"
                   outputClass:[AWSSupportDescribeTrustedAdvisorCheckSummariesResponse class]];
}

- (void)describeTrustedAdvisorCheckSummaries:(AWSSupportDescribeTrustedAdvisorCheckSummariesRequest *)request
     completionHandler:(void (^)(AWSSupportDescribeTrustedAdvisorCheckSummariesResponse *response, NSError *error))completionHandler {
    [[self describeTrustedAdvisorCheckSummaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportDescribeTrustedAdvisorCheckSummariesResponse *> * _Nonnull task) {
        AWSSupportDescribeTrustedAdvisorCheckSummariesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportDescribeTrustedAdvisorChecksResponse *> *)describeTrustedAdvisorChecks:(AWSSupportDescribeTrustedAdvisorChecksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"DescribeTrustedAdvisorChecks"
                   outputClass:[AWSSupportDescribeTrustedAdvisorChecksResponse class]];
}

- (void)describeTrustedAdvisorChecks:(AWSSupportDescribeTrustedAdvisorChecksRequest *)request
     completionHandler:(void (^)(AWSSupportDescribeTrustedAdvisorChecksResponse *response, NSError *error))completionHandler {
    [[self describeTrustedAdvisorChecks:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportDescribeTrustedAdvisorChecksResponse *> * _Nonnull task) {
        AWSSupportDescribeTrustedAdvisorChecksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportRefreshTrustedAdvisorCheckResponse *> *)refreshTrustedAdvisorCheck:(AWSSupportRefreshTrustedAdvisorCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"RefreshTrustedAdvisorCheck"
                   outputClass:[AWSSupportRefreshTrustedAdvisorCheckResponse class]];
}

- (void)refreshTrustedAdvisorCheck:(AWSSupportRefreshTrustedAdvisorCheckRequest *)request
     completionHandler:(void (^)(AWSSupportRefreshTrustedAdvisorCheckResponse *response, NSError *error))completionHandler {
    [[self refreshTrustedAdvisorCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportRefreshTrustedAdvisorCheckResponse *> * _Nonnull task) {
        AWSSupportRefreshTrustedAdvisorCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSupportResolveCaseResponse *> *)resolveCase:(AWSSupportResolveCaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSupport_20130415"
                 operationName:@"ResolveCase"
                   outputClass:[AWSSupportResolveCaseResponse class]];
}

- (void)resolveCase:(AWSSupportResolveCaseRequest *)request
     completionHandler:(void (^)(AWSSupportResolveCaseResponse *response, NSError *error))completionHandler {
    [[self resolveCase:request] continueWithBlock:^id _Nullable(AWSTask<AWSSupportResolveCaseResponse *> * _Nonnull task) {
        AWSSupportResolveCaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
