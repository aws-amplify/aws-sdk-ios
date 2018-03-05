//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSTranscribeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSTranscribe : AWSService

/**
 The service configuration used to instantiate this service client.

 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the
 SDK instantiates the default service client with `defaultServiceConfiguration`
 from `[AWSServiceManager defaultServiceManager]`. The reference to this object
 is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 @return The default service client.
 */
+ (instancetype)defaultTranscribe;

/**
 Creates a service client with the given service configuration and registers it for the key.

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.
 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerTranscribeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerS3WithConfiguration:forKey:` before invoking this method.

 @param key A string to identify the service client.
 @return An instance of the service client.
 */
+ (instancetype)transcribeForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 @warning Before calling this method, make sure no method is running on this client.
 @param key A string to identify the service client.
 */
+ (void)removeTranscribeForKey:(NSString *)key;

/**
 Starts a new transcribe job.

 @param jobName The name of the transcribe job
 @param completionHandler The completion handler to call when the load request is complete.
 `response` - A response object, or `nil` if the request failed.
 `error` - An error object that indicates why the request failed, or `nil` if the request was successful.

 @see AWSTranscribeStartTranscriptionJobRequest
 @see AWSTranscribeStartTranscriptionJobOutput
 */
- (AWSTask<AWSTranscribeStartTranscriptionJobOutput *> *)startTranscriptionJob:(NSString *)jobName
																  languageCode:(AWSTranscribeLanguageCode)languageCode
																	  mediaUri:(NSString*)mediaUri
																   mediaFormat:(AWSTranscribeMediaFormat)mediaFormat
															   mediaSampleRate:(NSNumber* _Nullable)mediaSampleRate
															 completionHandler:(void (^ _Nullable)(AWSTranscribeStartTranscriptionJobOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Gets an existing transaction job.

 @param jobName The name of the job to get.
 @param completionHandler The completion handler to call when the load request is complete.
 `response` - A response object, or `nil` if the request failed.
 `error` - An error object that indicates why the request failed, or `nil` if the request was successful.

 @see AWSTranscribeGetTranscriptionJobOutput
 @see AWSTranscribeError
 */
- (AWSTask<AWSTranscribeGetTranscriptionJobOutput *> *)getTranscriptionJob:(NSString *)jobName
														 completionHandler:(void (^ _Nullable)(AWSTranscribeGetTranscriptionJobOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Gets the results from a completed transcription job.

 @param fileUri The URI of the results returned in `AWSTranscribeGetTranscriptionJobOutput`.
 @param completionHandler The completion handler to call when the load request is complete.
 `response` - A response object, or `nil` if the request failed.
 `error` - An error object that indicates why the request failed, or `nil` if the request was successful.

 @see AWSTranscribeTranscript
 @see AWSTranscribeGetTranscriptionJobOutput
 */
- (NSURLSessionDataTask*)getTranscriptionJobResults:(NSString *)fileUri
								  completionHandler:(void (^ _Nullable)(AWSTranscribeTranscript * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Returns a list of all transcription jobs matching `jobStatus`.

 @param jobStatus The status of the jobs to list.
 @param completionHandler The completion handler to call when the load request is complete.
 `response` - A response object, or `nil` if the request failed.
 `error` - An error object that indicates why the request failed, or `nil` if the request was successful.

 @see AWSTranscribeListTranscriptionJobsOutput
 @see AWSTranscribeJobStatus
 @see AWSTranscribeError
 */
- (AWSTask<AWSTranscribeListTranscriptionJobsOutput *> *)listTranscriptionJobs:(AWSTranscribeJobStatus)jobStatus
															 completionHandler:(void (^ _Nullable)(AWSTranscribeListTranscriptionJobsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
