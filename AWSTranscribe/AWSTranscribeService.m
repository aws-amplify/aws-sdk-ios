//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTranscribeService.h"
#import "AWSTranscribeSerializer.h"

#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSTranscribeResources.h"

static NSString *const AWSInfoTranscribe = @"Transcribe";
static NSString *const AWSTranscribeSDKVersion = @"2.6.12";

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSTranscribe()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSTranscribe

+ (void)initialize {
	[super initialize];

	if (![AWSiOSSDKVersion isEqualToString:AWSTranscribeSDKVersion]) {
		@throw [NSException exceptionWithName:NSInternalInconsistencyException
									   reason:[NSString stringWithFormat:@"AWSCore and AWSTranscribe versions need to match. Check your SDK installation. AWSCore: %@ AWSTranscribe: %@", AWSiOSSDKVersion, AWSTranscribeSDKVersion]
									 userInfo:nil];
	}
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultTranscribe {
	static AWSTranscribe *_defaultTranscribe = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		AWSServiceConfiguration *serviceConfiguration = nil;
		AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoTranscribe];
		if (serviceInfo) {
			NSString* poolId = [serviceInfo infoDictionary][@"PoolId"];
			NSString* unauth = [serviceInfo infoDictionary][@"UnauthRoleArn"];
			NSString* auth = [serviceInfo infoDictionary][@"AuthRoleArn"];
			AWSCognitoCredentialsProviderHelper* helper = [[AWSCognitoCredentialsProviderHelper alloc] initWithRegionType:serviceInfo.region
																										   identityPoolId:poolId
																										  useEnhancedFlow:NO
																								  identityProviderManager:nil];
			AWSCognitoCredentialsProvider* provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:serviceInfo.region
																								  unauthRoleArn:unauth
																									authRoleArn:auth
																							   identityProvider:helper];

			serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
															   credentialsProvider:provider];
		}

		if (!serviceConfiguration) {
			serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
		}

		if (!serviceConfiguration) {
			@throw [NSException exceptionWithName:NSInternalInconsistencyException
										   reason:@"The service configuration is `nil`. You need to configure `awsconfiguration.json`, `Info.plist` or set `defaultServiceConfiguration` before using this method."
										 userInfo:nil];
		}


		_defaultTranscribe = [[AWSTranscribe alloc] initWithConfiguration:serviceConfiguration];
	});

	return _defaultTranscribe;
}

+ (void)registerTranscribeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_serviceClients = [AWSSynchronizedMutableDictionary new];
	});
	[_serviceClients setObject:[[AWSTranscribe alloc] initWithConfiguration:configuration]
						forKey:key];
}

+ (instancetype)transcribeForKey:(NSString *)key {
	@synchronized(self) {
		AWSTranscribe *serviceClient = [_serviceClients objectForKey:key];
		if (serviceClient) {
			return serviceClient;
		}

		AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoTranscribe
																	 forKey:key];
		if (serviceInfo) {
			AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
																						credentialsProvider:serviceInfo.cognitoCredentialsProvider];
			[AWSTranscribe registerTranscribeWithConfiguration:serviceConfiguration
										forKey:key];
		}

		return [_serviceClients objectForKey:key];
	}
}

+ (void)removeTranscribeForKey:(NSString *)key {
	[_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
	@throw [NSException exceptionWithName:NSInternalInconsistencyException
								   reason:@"`- init` is not a valid initializer. Use `+ defaultTranscribe` or `+ transcribeForKey:` instead."
								 userInfo:nil];
	return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
	if (self = [super init]) {
		_configuration = [configuration copy];

		if(!configuration.endpoint){
			_configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
																  service:AWSServiceTranscribe
															 useUnsafeURL:NO];
		}else{
			[_configuration.endpoint setRegion:_configuration.regionType
									   service:AWSServiceTranscribe];
		}


		AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
																						endpoint:_configuration.endpoint];
		AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
		_configuration.requestInterceptors = @[baseInterceptor, signer];

		_configuration.baseURL = _configuration.endpoint.URL;
		_configuration.retryHandler = [[AWSURLRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
		networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSTranscribeResources sharedInstance] JSONObject]
																							actionName:operationName];
		networkingRequest.responseSerializer = [[AWSTranscribeResponseSerializer alloc] initWithJSONDefinition:[[AWSTranscribeResources sharedInstance] JSONObject]
																							  actionName:operationName
																							 outputClass:outputClass];

		networkingRequest.URLString = URLString;
		return [self.networking sendRequest:networkingRequest];
	}
}

//------------------------------------------------------------------------------
#pragma mark - Service method
//------------------------------------------------------------------------------

- (AWSTask<AWSTranscribeStartTranscriptionJobOutput *> *)startTranscriptionJob:(AWSTranscribeStartTranscriptionJobRequest *)request {
	return [self invokeRequest:request
					HTTPMethod:AWSHTTPMethodPOST
					 URLString:@""
				  targetPrefix:@"Transcribe"
				 operationName:@"StartTranscriptionJob"
				   outputClass:[AWSTranscribeStartTranscriptionJobOutput class]];
}

- (AWSTask<AWSTranscribeStartTranscriptionJobOutput *> *)startTranscriptionJob:(NSString *)jobName
				 languageCode:(AWSTranscribeLanguageCode)languageCode
					 mediaUri:(NSString *)mediaUri
					 mediaFormat:(AWSTranscribeMediaFormat)mediaFormat
			  mediaSampleRate:(NSNumber *)mediaSampleRate
			completionHandler:(void (^)(AWSTranscribeStartTranscriptionJobOutput * _Nullable, NSError * _Nullable))completionHandler {

	AWSTranscribeStartTranscriptionJobRequest* request = [AWSTranscribeStartTranscriptionJobRequest new];
	request.jobName = jobName;
	request.languageCode = languageCode;
	request.media = [AWSTranscribeMedia new];
	request.media.fileUri = mediaUri;
	request.mediaSampleRateHertz = mediaSampleRate;
	request.mediaFormat = mediaFormat;
	return [[self startTranscriptionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeStartTranscriptionJobOutput *> * _Nonnull task) {
		AWSTranscribeStartTranscriptionJobOutput *result = task.result;
		NSError *error = task.error;
		if (completionHandler) {
			completionHandler(result, error);
		}

		return nil;
	}];
}

//------------------------------------------------------------------------------

- (AWSTask<AWSTranscribeGetTranscriptionJobOutput *> *)getTranscriptionJob:(AWSTranscribeGetTranscriptionJobRequest *)request {
	return [self invokeRequest:request
					HTTPMethod:AWSHTTPMethodPOST
					 URLString:@""
				  targetPrefix:@"Transcribe"
				 operationName:@"GetTranscriptionJob"
				   outputClass:[AWSTranscribeGetTranscriptionJobOutput class]];
}

- (AWSTask<AWSTranscribeGetTranscriptionJobOutput *> *)getTranscriptionJob:(NSString *)jobName
		completionHandler:(void (^)(AWSTranscribeGetTranscriptionJobOutput * _Nullable, NSError * _Nullable))completionHandler {
	AWSTranscribeGetTranscriptionJobRequest* request = [AWSTranscribeGetTranscriptionJobRequest new];
	request.jobName = jobName;
	return [[self getTranscriptionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeGetTranscriptionJobOutput *> * _Nonnull task) {
		AWSTranscribeGetTranscriptionJobOutput *result = task.result;
		NSError *error = task.error;
		if (completionHandler) {
			completionHandler(result, error);
		}

		return nil;
	}];
}

//------------------------------------------------------------------------------

- (NSURLSessionDataTask*)getTranscriptionJobResults:(NSString *)fileUri
		completionHandler:(void (^)(AWSTranscribeTranscript * _Nullable, NSError * _Nullable))completionHandler {
	NSURL *url = [NSURL URLWithString:fileUri];
	NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		if (error && completionHandler) {
			completionHandler(nil, error);
			return;
		}

		NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
		if (error && completionHandler) {
			completionHandler(nil, error);
			return;
		}

		AWSTranscribeTranscript *result = [AWSMTLJSONAdapter modelOfClass:AWSTranscribeTranscript.class fromJSONDictionary:json error:&error];
		if (completionHandler) {
			completionHandler(result, error);
		}
	}];
	[downloadTask resume];
	return downloadTask;
}

//------------------------------------------------------------------------------

- (AWSTask<AWSTranscribeListTranscriptionJobsOutput *> *)listTranscriptionJobs:(AWSTranscribeListTranscriptionJobsRequest *)request {
	return [self invokeRequest:request
					HTTPMethod:AWSHTTPMethodPOST
					 URLString:@""
				  targetPrefix:@"Transcribe"
				 operationName:@"ListTranscriptionJobs"
				   outputClass:[AWSTranscribeListTranscriptionJobsOutput class]];

}

- (AWSTask<AWSTranscribeListTranscriptionJobsOutput *> *)listTranscriptionJobs:(AWSTranscribeJobStatus)jobStatus
		completionHandler:(void (^)(AWSTranscribeListTranscriptionJobsOutput * _Nullable, NSError * _Nullable))completionHandler {
	AWSTranscribeListTranscriptionJobsRequest* request = [AWSTranscribeListTranscriptionJobsRequest new];
	request.status = jobStatus;
	return [[self listTranscriptionJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListTranscriptionJobsOutput *> * _Nonnull task) {
		AWSTranscribeListTranscriptionJobsOutput *result = task.result;
		NSError *error = task.error;
		if (completionHandler) {
			completionHandler(result, error);
		}

		return nil;
	}];
}

@end
