//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSLocationService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSLocationResources.h"

static NSString *const AWSInfoLocation = @"Location";
NSString *const AWSLocationSDKVersion = @"2.23.1";


@interface AWSLocationResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSLocationResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSLocationErrorAccessDenied),
                            @"ConflictException" : @(AWSLocationErrorConflict),
                            @"InternalServerException" : @(AWSLocationErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSLocationErrorResourceNotFound),
                            @"ThrottlingException" : @(AWSLocationErrorThrottling),
                            @"ValidationException" : @(AWSLocationErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSLocationErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSLocationErrorDomain
                                                 code:AWSLocationErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSLocationErrorDomain
                                     code:AWSLocationErrorUnknown
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

@interface AWSLocationRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSLocationRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSLocation()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSLocation

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSLocationSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSLocation versions need to match. Check your SDK installation. AWSCore: %@ AWSLocation: %@", AWSiOSSDKVersion, AWSLocationSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultLocation {
    static AWSLocation *_defaultLocation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoLocation];
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
        _defaultLocation = [[AWSLocation alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultLocation;
}

+ (void)registerLocationWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSLocation alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)LocationForKey:(NSString *)key {
    @synchronized(self) {
        AWSLocation *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoLocation
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSLocation registerLocationWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeLocationForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultLocation` or `+ LocationForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceLocation
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceLocation];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSLocationRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSLocationResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSLocationResponseSerializer alloc] initWithJSONDefinition:[[AWSLocationResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSLocationAssociateTrackerConsumerResponse *> *)associateTrackerConsumer:(AWSLocationAssociateTrackerConsumerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tracking/v0/trackers/{TrackerName}/consumers"
                  targetPrefix:@""
                 operationName:@"AssociateTrackerConsumer"
                   outputClass:[AWSLocationAssociateTrackerConsumerResponse class]];
}

- (void)associateTrackerConsumer:(AWSLocationAssociateTrackerConsumerRequest *)request
     completionHandler:(void (^)(AWSLocationAssociateTrackerConsumerResponse *response, NSError *error))completionHandler {
    [[self associateTrackerConsumer:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationAssociateTrackerConsumerResponse *> * _Nonnull task) {
        AWSLocationAssociateTrackerConsumerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationBatchDeleteGeofenceResponse *> *)batchDeleteGeofence:(AWSLocationBatchDeleteGeofenceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/geofencing/v0/collections/{CollectionName}/delete-geofences"
                  targetPrefix:@""
                 operationName:@"BatchDeleteGeofence"
                   outputClass:[AWSLocationBatchDeleteGeofenceResponse class]];
}

- (void)batchDeleteGeofence:(AWSLocationBatchDeleteGeofenceRequest *)request
     completionHandler:(void (^)(AWSLocationBatchDeleteGeofenceResponse *response, NSError *error))completionHandler {
    [[self batchDeleteGeofence:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationBatchDeleteGeofenceResponse *> * _Nonnull task) {
        AWSLocationBatchDeleteGeofenceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationBatchEvaluateGeofencesResponse *> *)batchEvaluateGeofences:(AWSLocationBatchEvaluateGeofencesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/geofencing/v0/collections/{CollectionName}/positions"
                  targetPrefix:@""
                 operationName:@"BatchEvaluateGeofences"
                   outputClass:[AWSLocationBatchEvaluateGeofencesResponse class]];
}

- (void)batchEvaluateGeofences:(AWSLocationBatchEvaluateGeofencesRequest *)request
     completionHandler:(void (^)(AWSLocationBatchEvaluateGeofencesResponse *response, NSError *error))completionHandler {
    [[self batchEvaluateGeofences:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationBatchEvaluateGeofencesResponse *> * _Nonnull task) {
        AWSLocationBatchEvaluateGeofencesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationBatchGetDevicePositionResponse *> *)batchGetDevicePosition:(AWSLocationBatchGetDevicePositionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tracking/v0/trackers/{TrackerName}/get-positions"
                  targetPrefix:@""
                 operationName:@"BatchGetDevicePosition"
                   outputClass:[AWSLocationBatchGetDevicePositionResponse class]];
}

- (void)batchGetDevicePosition:(AWSLocationBatchGetDevicePositionRequest *)request
     completionHandler:(void (^)(AWSLocationBatchGetDevicePositionResponse *response, NSError *error))completionHandler {
    [[self batchGetDevicePosition:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationBatchGetDevicePositionResponse *> * _Nonnull task) {
        AWSLocationBatchGetDevicePositionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationBatchPutGeofenceResponse *> *)batchPutGeofence:(AWSLocationBatchPutGeofenceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/geofencing/v0/collections/{CollectionName}/put-geofences"
                  targetPrefix:@""
                 operationName:@"BatchPutGeofence"
                   outputClass:[AWSLocationBatchPutGeofenceResponse class]];
}

- (void)batchPutGeofence:(AWSLocationBatchPutGeofenceRequest *)request
     completionHandler:(void (^)(AWSLocationBatchPutGeofenceResponse *response, NSError *error))completionHandler {
    [[self batchPutGeofence:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationBatchPutGeofenceResponse *> * _Nonnull task) {
        AWSLocationBatchPutGeofenceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationBatchUpdateDevicePositionResponse *> *)batchUpdateDevicePosition:(AWSLocationBatchUpdateDevicePositionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tracking/v0/trackers/{TrackerName}/positions"
                  targetPrefix:@""
                 operationName:@"BatchUpdateDevicePosition"
                   outputClass:[AWSLocationBatchUpdateDevicePositionResponse class]];
}

- (void)batchUpdateDevicePosition:(AWSLocationBatchUpdateDevicePositionRequest *)request
     completionHandler:(void (^)(AWSLocationBatchUpdateDevicePositionResponse *response, NSError *error))completionHandler {
    [[self batchUpdateDevicePosition:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationBatchUpdateDevicePositionResponse *> * _Nonnull task) {
        AWSLocationBatchUpdateDevicePositionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationCreateGeofenceCollectionResponse *> *)createGeofenceCollection:(AWSLocationCreateGeofenceCollectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/geofencing/v0/collections"
                  targetPrefix:@""
                 operationName:@"CreateGeofenceCollection"
                   outputClass:[AWSLocationCreateGeofenceCollectionResponse class]];
}

- (void)createGeofenceCollection:(AWSLocationCreateGeofenceCollectionRequest *)request
     completionHandler:(void (^)(AWSLocationCreateGeofenceCollectionResponse *response, NSError *error))completionHandler {
    [[self createGeofenceCollection:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationCreateGeofenceCollectionResponse *> * _Nonnull task) {
        AWSLocationCreateGeofenceCollectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationCreateMapResponse *> *)createMap:(AWSLocationCreateMapRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/maps/v0/maps"
                  targetPrefix:@""
                 operationName:@"CreateMap"
                   outputClass:[AWSLocationCreateMapResponse class]];
}

- (void)createMap:(AWSLocationCreateMapRequest *)request
     completionHandler:(void (^)(AWSLocationCreateMapResponse *response, NSError *error))completionHandler {
    [[self createMap:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationCreateMapResponse *> * _Nonnull task) {
        AWSLocationCreateMapResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationCreatePlaceIndexResponse *> *)createPlaceIndex:(AWSLocationCreatePlaceIndexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/places/v0/indexes"
                  targetPrefix:@""
                 operationName:@"CreatePlaceIndex"
                   outputClass:[AWSLocationCreatePlaceIndexResponse class]];
}

- (void)createPlaceIndex:(AWSLocationCreatePlaceIndexRequest *)request
     completionHandler:(void (^)(AWSLocationCreatePlaceIndexResponse *response, NSError *error))completionHandler {
    [[self createPlaceIndex:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationCreatePlaceIndexResponse *> * _Nonnull task) {
        AWSLocationCreatePlaceIndexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationCreateTrackerResponse *> *)createTracker:(AWSLocationCreateTrackerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tracking/v0/trackers"
                  targetPrefix:@""
                 operationName:@"CreateTracker"
                   outputClass:[AWSLocationCreateTrackerResponse class]];
}

- (void)createTracker:(AWSLocationCreateTrackerRequest *)request
     completionHandler:(void (^)(AWSLocationCreateTrackerResponse *response, NSError *error))completionHandler {
    [[self createTracker:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationCreateTrackerResponse *> * _Nonnull task) {
        AWSLocationCreateTrackerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationDeleteGeofenceCollectionResponse *> *)deleteGeofenceCollection:(AWSLocationDeleteGeofenceCollectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/geofencing/v0/collections/{CollectionName}"
                  targetPrefix:@""
                 operationName:@"DeleteGeofenceCollection"
                   outputClass:[AWSLocationDeleteGeofenceCollectionResponse class]];
}

- (void)deleteGeofenceCollection:(AWSLocationDeleteGeofenceCollectionRequest *)request
     completionHandler:(void (^)(AWSLocationDeleteGeofenceCollectionResponse *response, NSError *error))completionHandler {
    [[self deleteGeofenceCollection:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationDeleteGeofenceCollectionResponse *> * _Nonnull task) {
        AWSLocationDeleteGeofenceCollectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationDeleteMapResponse *> *)deleteMap:(AWSLocationDeleteMapRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/maps/v0/maps/{MapName}"
                  targetPrefix:@""
                 operationName:@"DeleteMap"
                   outputClass:[AWSLocationDeleteMapResponse class]];
}

- (void)deleteMap:(AWSLocationDeleteMapRequest *)request
     completionHandler:(void (^)(AWSLocationDeleteMapResponse *response, NSError *error))completionHandler {
    [[self deleteMap:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationDeleteMapResponse *> * _Nonnull task) {
        AWSLocationDeleteMapResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationDeletePlaceIndexResponse *> *)deletePlaceIndex:(AWSLocationDeletePlaceIndexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/places/v0/indexes/{IndexName}"
                  targetPrefix:@""
                 operationName:@"DeletePlaceIndex"
                   outputClass:[AWSLocationDeletePlaceIndexResponse class]];
}

- (void)deletePlaceIndex:(AWSLocationDeletePlaceIndexRequest *)request
     completionHandler:(void (^)(AWSLocationDeletePlaceIndexResponse *response, NSError *error))completionHandler {
    [[self deletePlaceIndex:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationDeletePlaceIndexResponse *> * _Nonnull task) {
        AWSLocationDeletePlaceIndexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationDeleteTrackerResponse *> *)deleteTracker:(AWSLocationDeleteTrackerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tracking/v0/trackers/{TrackerName}"
                  targetPrefix:@""
                 operationName:@"DeleteTracker"
                   outputClass:[AWSLocationDeleteTrackerResponse class]];
}

- (void)deleteTracker:(AWSLocationDeleteTrackerRequest *)request
     completionHandler:(void (^)(AWSLocationDeleteTrackerResponse *response, NSError *error))completionHandler {
    [[self deleteTracker:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationDeleteTrackerResponse *> * _Nonnull task) {
        AWSLocationDeleteTrackerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationDescribeGeofenceCollectionResponse *> *)describeGeofenceCollection:(AWSLocationDescribeGeofenceCollectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/geofencing/v0/collections/{CollectionName}"
                  targetPrefix:@""
                 operationName:@"DescribeGeofenceCollection"
                   outputClass:[AWSLocationDescribeGeofenceCollectionResponse class]];
}

- (void)describeGeofenceCollection:(AWSLocationDescribeGeofenceCollectionRequest *)request
     completionHandler:(void (^)(AWSLocationDescribeGeofenceCollectionResponse *response, NSError *error))completionHandler {
    [[self describeGeofenceCollection:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationDescribeGeofenceCollectionResponse *> * _Nonnull task) {
        AWSLocationDescribeGeofenceCollectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationDescribeMapResponse *> *)describeMap:(AWSLocationDescribeMapRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/maps/v0/maps/{MapName}"
                  targetPrefix:@""
                 operationName:@"DescribeMap"
                   outputClass:[AWSLocationDescribeMapResponse class]];
}

- (void)describeMap:(AWSLocationDescribeMapRequest *)request
     completionHandler:(void (^)(AWSLocationDescribeMapResponse *response, NSError *error))completionHandler {
    [[self describeMap:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationDescribeMapResponse *> * _Nonnull task) {
        AWSLocationDescribeMapResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationDescribePlaceIndexResponse *> *)describePlaceIndex:(AWSLocationDescribePlaceIndexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/places/v0/indexes/{IndexName}"
                  targetPrefix:@""
                 operationName:@"DescribePlaceIndex"
                   outputClass:[AWSLocationDescribePlaceIndexResponse class]];
}

- (void)describePlaceIndex:(AWSLocationDescribePlaceIndexRequest *)request
     completionHandler:(void (^)(AWSLocationDescribePlaceIndexResponse *response, NSError *error))completionHandler {
    [[self describePlaceIndex:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationDescribePlaceIndexResponse *> * _Nonnull task) {
        AWSLocationDescribePlaceIndexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationDescribeTrackerResponse *> *)describeTracker:(AWSLocationDescribeTrackerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tracking/v0/trackers/{TrackerName}"
                  targetPrefix:@""
                 operationName:@"DescribeTracker"
                   outputClass:[AWSLocationDescribeTrackerResponse class]];
}

- (void)describeTracker:(AWSLocationDescribeTrackerRequest *)request
     completionHandler:(void (^)(AWSLocationDescribeTrackerResponse *response, NSError *error))completionHandler {
    [[self describeTracker:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationDescribeTrackerResponse *> * _Nonnull task) {
        AWSLocationDescribeTrackerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationDisassociateTrackerConsumerResponse *> *)disassociateTrackerConsumer:(AWSLocationDisassociateTrackerConsumerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tracking/v0/trackers/{TrackerName}/consumers/{ConsumerArn}"
                  targetPrefix:@""
                 operationName:@"DisassociateTrackerConsumer"
                   outputClass:[AWSLocationDisassociateTrackerConsumerResponse class]];
}

- (void)disassociateTrackerConsumer:(AWSLocationDisassociateTrackerConsumerRequest *)request
     completionHandler:(void (^)(AWSLocationDisassociateTrackerConsumerResponse *response, NSError *error))completionHandler {
    [[self disassociateTrackerConsumer:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationDisassociateTrackerConsumerResponse *> * _Nonnull task) {
        AWSLocationDisassociateTrackerConsumerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationGetDevicePositionResponse *> *)getDevicePosition:(AWSLocationGetDevicePositionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tracking/v0/trackers/{TrackerName}/devices/{DeviceId}/positions/latest"
                  targetPrefix:@""
                 operationName:@"GetDevicePosition"
                   outputClass:[AWSLocationGetDevicePositionResponse class]];
}

- (void)getDevicePosition:(AWSLocationGetDevicePositionRequest *)request
     completionHandler:(void (^)(AWSLocationGetDevicePositionResponse *response, NSError *error))completionHandler {
    [[self getDevicePosition:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationGetDevicePositionResponse *> * _Nonnull task) {
        AWSLocationGetDevicePositionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationGetDevicePositionHistoryResponse *> *)getDevicePositionHistory:(AWSLocationGetDevicePositionHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tracking/v0/trackers/{TrackerName}/devices/{DeviceId}/list-positions"
                  targetPrefix:@""
                 operationName:@"GetDevicePositionHistory"
                   outputClass:[AWSLocationGetDevicePositionHistoryResponse class]];
}

- (void)getDevicePositionHistory:(AWSLocationGetDevicePositionHistoryRequest *)request
     completionHandler:(void (^)(AWSLocationGetDevicePositionHistoryResponse *response, NSError *error))completionHandler {
    [[self getDevicePositionHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationGetDevicePositionHistoryResponse *> * _Nonnull task) {
        AWSLocationGetDevicePositionHistoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationGetGeofenceResponse *> *)getGeofence:(AWSLocationGetGeofenceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/geofencing/v0/collections/{CollectionName}/geofences/{GeofenceId}"
                  targetPrefix:@""
                 operationName:@"GetGeofence"
                   outputClass:[AWSLocationGetGeofenceResponse class]];
}

- (void)getGeofence:(AWSLocationGetGeofenceRequest *)request
     completionHandler:(void (^)(AWSLocationGetGeofenceResponse *response, NSError *error))completionHandler {
    [[self getGeofence:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationGetGeofenceResponse *> * _Nonnull task) {
        AWSLocationGetGeofenceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationGetMapGlyphsResponse *> *)getMapGlyphs:(AWSLocationGetMapGlyphsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/maps/v0/maps/{MapName}/glyphs/{FontStack}/{FontUnicodeRange}"
                  targetPrefix:@""
                 operationName:@"GetMapGlyphs"
                   outputClass:[AWSLocationGetMapGlyphsResponse class]];
}

- (void)getMapGlyphs:(AWSLocationGetMapGlyphsRequest *)request
     completionHandler:(void (^)(AWSLocationGetMapGlyphsResponse *response, NSError *error))completionHandler {
    [[self getMapGlyphs:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationGetMapGlyphsResponse *> * _Nonnull task) {
        AWSLocationGetMapGlyphsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationGetMapSpritesResponse *> *)getMapSprites:(AWSLocationGetMapSpritesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/maps/v0/maps/{MapName}/sprites/{FileName}"
                  targetPrefix:@""
                 operationName:@"GetMapSprites"
                   outputClass:[AWSLocationGetMapSpritesResponse class]];
}

- (void)getMapSprites:(AWSLocationGetMapSpritesRequest *)request
     completionHandler:(void (^)(AWSLocationGetMapSpritesResponse *response, NSError *error))completionHandler {
    [[self getMapSprites:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationGetMapSpritesResponse *> * _Nonnull task) {
        AWSLocationGetMapSpritesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationGetMapStyleDescriptorResponse *> *)getMapStyleDescriptor:(AWSLocationGetMapStyleDescriptorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/maps/v0/maps/{MapName}/style-descriptor"
                  targetPrefix:@""
                 operationName:@"GetMapStyleDescriptor"
                   outputClass:[AWSLocationGetMapStyleDescriptorResponse class]];
}

- (void)getMapStyleDescriptor:(AWSLocationGetMapStyleDescriptorRequest *)request
     completionHandler:(void (^)(AWSLocationGetMapStyleDescriptorResponse *response, NSError *error))completionHandler {
    [[self getMapStyleDescriptor:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationGetMapStyleDescriptorResponse *> * _Nonnull task) {
        AWSLocationGetMapStyleDescriptorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationGetMapTileResponse *> *)getMapTile:(AWSLocationGetMapTileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/maps/v0/maps/{MapName}/tiles/{Z}/{X}/{Y}"
                  targetPrefix:@""
                 operationName:@"GetMapTile"
                   outputClass:[AWSLocationGetMapTileResponse class]];
}

- (void)getMapTile:(AWSLocationGetMapTileRequest *)request
     completionHandler:(void (^)(AWSLocationGetMapTileResponse *response, NSError *error))completionHandler {
    [[self getMapTile:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationGetMapTileResponse *> * _Nonnull task) {
        AWSLocationGetMapTileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationListGeofenceCollectionsResponse *> *)listGeofenceCollections:(AWSLocationListGeofenceCollectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/geofencing/v0/list-collections"
                  targetPrefix:@""
                 operationName:@"ListGeofenceCollections"
                   outputClass:[AWSLocationListGeofenceCollectionsResponse class]];
}

- (void)listGeofenceCollections:(AWSLocationListGeofenceCollectionsRequest *)request
     completionHandler:(void (^)(AWSLocationListGeofenceCollectionsResponse *response, NSError *error))completionHandler {
    [[self listGeofenceCollections:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationListGeofenceCollectionsResponse *> * _Nonnull task) {
        AWSLocationListGeofenceCollectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationListGeofencesResponse *> *)listGeofences:(AWSLocationListGeofencesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/geofencing/v0/collections/{CollectionName}/list-geofences"
                  targetPrefix:@""
                 operationName:@"ListGeofences"
                   outputClass:[AWSLocationListGeofencesResponse class]];
}

- (void)listGeofences:(AWSLocationListGeofencesRequest *)request
     completionHandler:(void (^)(AWSLocationListGeofencesResponse *response, NSError *error))completionHandler {
    [[self listGeofences:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationListGeofencesResponse *> * _Nonnull task) {
        AWSLocationListGeofencesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationListMapsResponse *> *)listMaps:(AWSLocationListMapsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/maps/v0/list-maps"
                  targetPrefix:@""
                 operationName:@"ListMaps"
                   outputClass:[AWSLocationListMapsResponse class]];
}

- (void)listMaps:(AWSLocationListMapsRequest *)request
     completionHandler:(void (^)(AWSLocationListMapsResponse *response, NSError *error))completionHandler {
    [[self listMaps:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationListMapsResponse *> * _Nonnull task) {
        AWSLocationListMapsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationListPlaceIndexesResponse *> *)listPlaceIndexes:(AWSLocationListPlaceIndexesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/places/v0/list-indexes"
                  targetPrefix:@""
                 operationName:@"ListPlaceIndexes"
                   outputClass:[AWSLocationListPlaceIndexesResponse class]];
}

- (void)listPlaceIndexes:(AWSLocationListPlaceIndexesRequest *)request
     completionHandler:(void (^)(AWSLocationListPlaceIndexesResponse *response, NSError *error))completionHandler {
    [[self listPlaceIndexes:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationListPlaceIndexesResponse *> * _Nonnull task) {
        AWSLocationListPlaceIndexesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationListTrackerConsumersResponse *> *)listTrackerConsumers:(AWSLocationListTrackerConsumersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tracking/v0/trackers/{TrackerName}/list-consumers"
                  targetPrefix:@""
                 operationName:@"ListTrackerConsumers"
                   outputClass:[AWSLocationListTrackerConsumersResponse class]];
}

- (void)listTrackerConsumers:(AWSLocationListTrackerConsumersRequest *)request
     completionHandler:(void (^)(AWSLocationListTrackerConsumersResponse *response, NSError *error))completionHandler {
    [[self listTrackerConsumers:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationListTrackerConsumersResponse *> * _Nonnull task) {
        AWSLocationListTrackerConsumersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationListTrackersResponse *> *)listTrackers:(AWSLocationListTrackersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tracking/v0/list-trackers"
                  targetPrefix:@""
                 operationName:@"ListTrackers"
                   outputClass:[AWSLocationListTrackersResponse class]];
}

- (void)listTrackers:(AWSLocationListTrackersRequest *)request
     completionHandler:(void (^)(AWSLocationListTrackersResponse *response, NSError *error))completionHandler {
    [[self listTrackers:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationListTrackersResponse *> * _Nonnull task) {
        AWSLocationListTrackersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationPutGeofenceResponse *> *)putGeofence:(AWSLocationPutGeofenceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/geofencing/v0/collections/{CollectionName}/geofences/{GeofenceId}"
                  targetPrefix:@""
                 operationName:@"PutGeofence"
                   outputClass:[AWSLocationPutGeofenceResponse class]];
}

- (void)putGeofence:(AWSLocationPutGeofenceRequest *)request
     completionHandler:(void (^)(AWSLocationPutGeofenceResponse *response, NSError *error))completionHandler {
    [[self putGeofence:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationPutGeofenceResponse *> * _Nonnull task) {
        AWSLocationPutGeofenceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationSearchPlaceIndexForPositionResponse *> *)searchPlaceIndexForPosition:(AWSLocationSearchPlaceIndexForPositionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/places/v0/indexes/{IndexName}/search/position"
                  targetPrefix:@""
                 operationName:@"SearchPlaceIndexForPosition"
                   outputClass:[AWSLocationSearchPlaceIndexForPositionResponse class]];
}

- (void)searchPlaceIndexForPosition:(AWSLocationSearchPlaceIndexForPositionRequest *)request
     completionHandler:(void (^)(AWSLocationSearchPlaceIndexForPositionResponse *response, NSError *error))completionHandler {
    [[self searchPlaceIndexForPosition:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationSearchPlaceIndexForPositionResponse *> * _Nonnull task) {
        AWSLocationSearchPlaceIndexForPositionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLocationSearchPlaceIndexForTextResponse *> *)searchPlaceIndexForText:(AWSLocationSearchPlaceIndexForTextRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/places/v0/indexes/{IndexName}/search/text"
                  targetPrefix:@""
                 operationName:@"SearchPlaceIndexForText"
                   outputClass:[AWSLocationSearchPlaceIndexForTextResponse class]];
}

- (void)searchPlaceIndexForText:(AWSLocationSearchPlaceIndexForTextRequest *)request
     completionHandler:(void (^)(AWSLocationSearchPlaceIndexForTextResponse *response, NSError *error))completionHandler {
    [[self searchPlaceIndexForText:request] continueWithBlock:^id _Nullable(AWSTask<AWSLocationSearchPlaceIndexForTextResponse *> * _Nonnull task) {
        AWSLocationSearchPlaceIndexForTextResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
