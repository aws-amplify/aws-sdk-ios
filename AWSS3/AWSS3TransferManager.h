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

#import "AWSS3Service.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSS3TransferManagerErrorDomain;
typedef NS_ENUM(NSInteger, AWSS3TransferManagerErrorType) {
    AWSS3TransferManagerErrorUnknown,
    AWSS3TransferManagerErrorCancelled,
    AWSS3TransferManagerErrorPaused,
    AWSS3TransferManagerErrorCompleted,
    AWSS3TransferManagerErrorInternalInConsistency,
    AWSS3TransferManagerErrorMissingRequiredParameters,
    AWSS3TransferManagerErrorInvalidParameters,
};

typedef NS_ENUM(NSInteger, AWSS3TransferManagerRequestState) {
    AWSS3TransferManagerRequestStateNotStarted,
    AWSS3TransferManagerRequestStateRunning,
    AWSS3TransferManagerRequestStatePaused,
    AWSS3TransferManagerRequestStateCanceling,
    AWSS3TransferManagerRequestStateCompleted,
};

typedef void (^AWSS3TransferManagerResumeAllBlock) (AWSRequest *request);

@class AWSS3;
@class AWSS3TransferManagerUploadRequest;
@class AWSS3TransferManagerUploadOutput;
@class AWSS3TransferManagerDownloadRequest;
@class AWSS3TransferManagerDownloadOutput;

/**
 High level utility for managing transfers to Amazon S3. S3TransferManager provides a simple API for uploading and downloading content to Amazon S3, and makes extensive use of Amazon S3 multipart uploads to achieve enhanced throughput, performance and reliability.
 */
@interface AWSS3TransferManager : AWSService

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let S3TransferManager = AWSS3TransferManager.defaultS3TransferManager()

 *Objective-C*

     AWSS3TransferManager *S3TransferManager = [AWSS3TransferManager defaultS3TransferManager];

 @return The default service client.
 */
+ (instancetype)defaultS3TransferManager;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSS3TransferManager.registerS3TransferManagerWithConfiguration(configuration, forKey: "USWest2S3TransferManager")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSS3TransferManager registerS3TransferManagerWithConfiguration:configuration forKey:@"USWest2S3TransferManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let S3TransferManager = AWSS3TransferManager(forKey: "USWest2S3TransferManager")

 *Objective-C*

     AWSS3TransferManager *S3TransferManager = [AWSS3TransferManager S3TransferManagerForKey:@"USWest2S3TransferManager"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerS3TransferManagerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerS3TransferManagerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSS3TransferManager.registerS3TransferManagerWithConfiguration(configuration, forKey: "USWest2S3TransferManager")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSS3TransferManager registerS3TransferManagerWithConfiguration:configuration forKey:@"USWest2S3TransferManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let S3TransferManager = AWSS3TransferManager(forKey: "USWest2S3TransferManager")

 *Objective-C*

     AWSS3TransferManager *S3TransferManager = [AWSS3TransferManager S3TransferManagerForKey:@"USWest2S3TransferManager"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)S3TransferManagerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 @warning Before calling this method, make sure no method is running on this client.

 @param key A string to identify the service client.
 */
+ (void)removeS3TransferManagerForKey:(NSString *)key;

/**
 Schedules a new transfer to upload data to Amazon S3.

 @param uploadRequest The upload request.

 @return AWSTask.
 */
- (AWSTask *)upload:(AWSS3TransferManagerUploadRequest *)uploadRequest;

/**
 Schedules a new transfer to download data from Amazon S3 and save it to the specified file.

 @param downloadRequest The download request.

 @return AWSTask.
 */
- (AWSTask *)download:(AWSS3TransferManagerDownloadRequest *)downloadRequest;

/**
 Cancels all of the upload and download requests.

 @return AWSTask.
 */
- (AWSTask *)cancelAll;

/**
 Pauses all of the upload and download requests.

 @return AWSTask.
 */
- (AWSTask *)pauseAll;

/**
 Resumes all of the upload and download requests.

 @param block The block to optionally re-set the progress blocks to the requests.

 @return AWSTask.
 */
- (AWSTask *)resumeAll:(AWSS3TransferManagerResumeAllBlock)block;

/**
 Clears the local cache.

 @return AWSTask.
 */
- (AWSTask *)clearCache;

@end

@interface AWSS3TransferManagerUploadRequest : AWSS3PutObjectRequest

@property (nonatomic, assign, readonly) AWSS3TransferManagerRequestState state;
@property (nonatomic, strong) NSURL *body;

@end

@interface AWSS3TransferManagerUploadOutput : AWSS3PutObjectOutput

@end

@interface AWSS3TransferManagerDownloadRequest : AWSS3GetObjectRequest

@property (nonatomic, assign, readonly) AWSS3TransferManagerRequestState state;

@end

@interface AWSS3TransferManagerDownloadOutput : AWSS3GetObjectOutput

@end

NS_ASSUME_NONNULL_END
