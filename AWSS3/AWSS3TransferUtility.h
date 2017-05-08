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

#import <UIKit/UIKit.h>
#import <AWSCore/AWSCore.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSS3TransferUtilityErrorDomain;
typedef NS_ENUM(NSInteger, AWSS3TransferUtilityErrorType) {
    AWSS3TransferUtilityErrorUnknown,
    AWSS3TransferUtilityErrorRedirection,
    AWSS3TransferUtilityErrorClientError,
    AWSS3TransferUtilityErrorServerError,
    AWSS3TransferUtilityErrorLocalFileNotFound
};

FOUNDATION_EXPORT NSString *const AWSS3TransferUtilityURLSessionDidBecomeInvalidNotification;

@class AWSS3TransferUtilityConfiguration;
@class AWSS3TransferUtilityTask;
@class AWSS3TransferUtilityUploadTask;
@class AWSS3TransferUtilityDownloadTask;
@class AWSS3TransferUtilityExpression;
@class AWSS3TransferUtilityUploadExpression;
@class AWSS3TransferUtilityDownloadExpression;

/**
 The upload completion handler.

 @param task  The upload task object.
 @param error Returns the error object when the download failed.
 */
typedef void (^AWSS3TransferUtilityUploadCompletionHandlerBlock) (AWSS3TransferUtilityUploadTask *task,
                                                                  NSError * _Nullable error);

/**
 The download completion handler.

 @param task     The download task object.
 @param location When downloading an Amazon S3 object to a file, returns a file URL of the returned object. Otherwise, returns `nil`.
 @param data     When downloading an Amazon S3 object as an `NSData`, returns the returned object as an instance of `NSData`. Otherwise, returns `nil`.
 @param error    Returns the error object when the download failed. Returns `nil` on successful downlaod.
 */
typedef void (^AWSS3TransferUtilityDownloadCompletionHandlerBlock) (AWSS3TransferUtilityDownloadTask *task,
                                                                    NSURL * _Nullable location,
                                                                    NSData * _Nullable data,
                                                                    NSError * _Nullable error);

/**
 The transfer progress feedback block.

 @param task                     The upload task object.
 @param progress                 The progress object.

 @note Refer to `- URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:` in `NSURLSessionTaskDelegate` for more details on upload progress and `- URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:` in `NSURLSessionDownloadDelegate` for more details on download progress.
 */
typedef void (^AWSS3TransferUtilityProgressBlock) (AWSS3TransferUtilityTask *task,
                                                   NSProgress *progress);

#pragma mark - AWSS3TransferUtility

/**
 A high-level utility for managing background uploads and downloads. The transfers continue even when the app is suspended. You must call `+ application:handleEventsForBackgroundURLSession:completionHandler:` in the `- application:handleEventsForBackgroundURLSession:completionHandler:` application delegate in order for the background transfer callback to work.
 */
@interface AWSS3TransferUtility : AWSService

/**
 The service configuration used to instantiate this service client.

 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.default().defaultServiceConfiguration = configuration

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

     let S3TransferUtility = AWSS3TransferUtility.default()

 *Objective-C*

     AWSS3TransferUtility *S3TransferUtility = [AWSS3TransferUtility defaultS3TransferUtility];

 @return The default service client.
 */
+ (instancetype)defaultS3TransferUtility;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSS3TransferUtility.register(with: configuration!, forKey: "USWest2S3TransferUtility")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration forKey:@"USWest2S3TransferUtility"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let S3TransferUtility = AWSS3TransferUtility(forKey: "USWest2S3TransferUtility")

 *Objective-C*

     AWSS3TransferUtility *S3TransferUtility = [AWSS3TransferUtility S3TransferUtilityForKey:@"USWest2S3TransferUtility"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration
                                            forKey:(NSString *)key;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSS3TransferUtility.register(with: configuration!, transferUtilityConfiguration: nil, forKey: "USWest2S3TransferUtility")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration transferUtilityConfiguration:nil forKey:@"USWest2S3TransferUtility"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let S3TransferUtility = AWSS3TransferUtility(forKey: "USWest2S3TransferUtility")

 *Objective-C*

     AWSS3TransferUtility *S3TransferUtility = [AWSS3TransferUtility S3TransferUtilityForKey:@"USWest2S3TransferUtility"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param transferUtilityConfiguration An S3 transfer utility configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration
                      transferUtilityConfiguration:(nullable AWSS3TransferUtilityConfiguration *)transferUtilityConfiguration
                                            forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerS3TransferUtilityWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1 identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2 credentialsProvider:credentialsProvider];

         [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration forKey:@"USWest2S3TransferUtility"];

         return YES;
     }

 Then call the following to get the service client:

     AWSS3TransferUtility *S3TransferUtility = [AWSS3TransferUtility S3ForKey:@"USWest2S3TransferUtility"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)S3TransferUtilityForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 The underlying NSURLSession is invalidated, and after the invalidation has completed the transfer is utility removed.

 Observe the AWSS3TransferUtilityURLSessionDidBecomeInvalidNotification to be informed when this has occurred.

 @warning Before calling this method, make sure no method is running on this client.

 @param key A string to identify the service client.
 */
+ (void)removeS3TransferUtilityForKey:(NSString *)key;

/**
 Tells `AWSS3TransferUtility` that events related to a URL session are waiting to be processed. This method needs to be called in the `- application:handleEventsForBackgroundURLSession:completionHandler:` applicatoin delegate for `AWSS3TransferUtility` to work.

 @param application       The singleton app object.
 @param identifier        The identifier of the URL session requiring attention.
 @param completionHandler The completion handler to call when you finish processing the events.
 */
+ (void)interceptApplication:(UIApplication *)application
handleEventsForBackgroundURLSession:(NSString *)identifier
           completionHandler:(void (^)())completionHandler;

/**
 Saves the `NSData` to a temporary directory and uploads it to the specified Amazon S3 bucket.

 @param data              The data to upload.
 @param bucket            The Amazon S3 bucket name.
 @param key               The Amazon S3 object key name.
 @param contentType       `Content-Type` of the data.
 @param expression        The container object to configure the upload request.
 @param completionHandler The completion handler when the upload completes.

 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityUploadTask`.
 */
- (AWSTask<AWSS3TransferUtilityUploadTask *> *)uploadData:(NSData *)data
                                                   bucket:(NSString *)bucket
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(nullable AWSS3TransferUtilityUploadExpression *)expression
                                        completionHandler:(nullable AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler;

/**
 Uploads the file to the specified Amazon S3 bucket.

 @param fileURL           The file URL of the file to upload.
 @param bucket            The Amazon S3 bucket name.
 @param key               The Amazon S3 object key name.
 @param contentType       `Content-Type` of the file.
 @param expression        The container object to configure the upload request.
 @param completionHandler The completion handler when the upload completes.

 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityUploadTask`.
 */
- (AWSTask<AWSS3TransferUtilityUploadTask *> *)uploadFile:(NSURL *)fileURL
                                                   bucket:(NSString *)bucket
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(nullable AWSS3TransferUtilityUploadExpression *)expression
                                        completionHandler:(nullable AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler;

/**
 Downloads the specified Amazon S3 object as `NSData`.

 @param bucket            The Amazon S3 bucket name.
 @param key               The Amazon S3 object key name.
 @param expression        The container object to configure the download request.
 @param completionHandler The completion handler when the download completes.

 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityDownloadTask`.
 */
- (AWSTask<AWSS3TransferUtilityDownloadTask *> *)downloadDataFromBucket:(NSString *)bucket
                                                                    key:(NSString *)key
                                                             expression:(nullable AWSS3TransferUtilityDownloadExpression *)expression
                                                      completionHandler:(nullable AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler;

/**
 Downloads the specified Amazon S3 object to a file URL.

 @param fileURL           The file URL to download the object to.
 @param bucket            The Amazon S3 bucket name.
 @param key               The Amazon S3 object key name.
 @param expression        The container object to configure the download request.
 @param completionHandler The completion handler when the download completes.

 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityDownloadTask`.
 */
- (AWSTask<AWSS3TransferUtilityDownloadTask *> *)downloadToURL:(NSURL *)fileURL
                                                        bucket:(NSString *)bucket
                                                           key:(NSString *)key
                                                    expression:(nullable AWSS3TransferUtilityDownloadExpression *)expression
                                             completionHandler:(nullable AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler;

/**
 Assigns progress feedback and completion handler blocks. This method should be called when the app was suspended while the transfer is still happening.

 @param uploadBlocksAssigner   The block for assigning the upload pregree feedback and completion handler blocks.
 @param downloadBlocksAssigner The block for assigning the download pregree feedback and completion handler blocks.
 */
- (void)enumerateToAssignBlocksForUploadTask:(nullable void (^)(AWSS3TransferUtilityUploadTask *uploadTask,
                                                                _Nullable AWSS3TransferUtilityProgressBlock * _Nullable uploadProgressBlockReference,
                                                                _Nullable AWSS3TransferUtilityUploadCompletionHandlerBlock * _Nullable completionHandlerReference))uploadBlocksAssigner
                                downloadTask:(nullable void (^)(AWSS3TransferUtilityDownloadTask *downloadTask,
                                                                _Nullable AWSS3TransferUtilityProgressBlock * _Nullable downloadProgressBlockReference,
                                                                _Nullable AWSS3TransferUtilityDownloadCompletionHandlerBlock * _Nullable completionHandlerReference))downloadBlocksAssigner;

/**
 Retrieves all running tasks.

 @return An array of `AWSS3TransferUtilityTask`.
 */
- (AWSTask<NSArray<__kindof AWSS3TransferUtilityTask *> *> *)getAllTasks;

/**
 Retrieves all running upload tasks.

 @return An array of `AWSS3TransferUtilityUploadTask`.
 */
- (AWSTask<NSArray<AWSS3TransferUtilityUploadTask *> *> *)getUploadTasks;

/**
 Retrieves all running download tasks.

 @return An array of `AWSS3TransferUtilityDownloadTask`.
 */
- (AWSTask<NSArray<AWSS3TransferUtilityDownloadTask *> *> *)getDownloadTasks;

@end

#pragma mark - AWSS3TransferUtilityConfiguration

@interface AWSS3TransferUtilityConfiguration : NSObject <NSCopying>

@property (nonatomic, assign, getter=isAccelerateModeEnabled) BOOL accelerateModeEnabled;

@end


#pragma mark - AWSS3TransferUtilityTasks

/**
 The task object to represent a upload or download task.
 */
@interface AWSS3TransferUtilityTask : NSObject

/**
 An identifier uniquely identifies the task within a given `AWSS3TransferUtility` instance.
 */
@property (readonly) NSUInteger taskIdentifier;

/**
 The Amazon S3 bucket name associated with the transfer.
 */
@property (readonly) NSString *bucket;

/**
 The Amazon S3 object key name associated with the transfer.
 */
@property (readonly) NSString *key;

/**
 The transfer progress.
 */
@property (readonly) NSProgress *progress;

/**
 The underlying `NSURLSessionTask` object.
 */
@property (readonly) NSURLSessionTask *sessionTask;

/**
 The HTTP request object.
 */
@property (nullable, readonly) NSURLRequest *request;

/**
 The HTTP response object. May be nil if no response has been received.
 */
@property (nullable, readonly) NSHTTPURLResponse *response;

/**
 Cancels the task.
 */
- (void)cancel;

/**
 Resumes the task, if it is suspended.
 */
- (void)resume;

/**
 Temporarily suspends a task.
 */
- (void)suspend;

@end

/**
 The task object to represent a upload task.
 */
@interface AWSS3TransferUtilityUploadTask : AWSS3TransferUtilityTask

@end

/**
 The task object to represent a download task.
 */
@interface AWSS3TransferUtilityDownloadTask : AWSS3TransferUtilityTask

@end

#pragma mark - AWSS3TransferUtilityExpressions

/**
 The expression object for configuring a upload or download task.
 */
@interface AWSS3TransferUtilityExpression : NSObject

/**
 This NSDictionary can contains additional request headers to be included in the pre-signed URL. Default is emtpy.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, NSString *> *requestHeaders;

/**
 This NSDictionary can contains additional request parameters to be included in the pre-signed URL. Adding additional request parameters enables more advanced pre-signed URLs, such as accessing Amazon S3's torrent resource for an object, or for specifying a version ID when accessing an object. Default is emtpy.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, NSString *> *requestParameters;

/**
 The progress feedback block.
 */
@property (copy, nonatomic, nullable) AWSS3TransferUtilityProgressBlock progressBlock;

/**
 Set an additional request header to be included in the pre-signed URL.

 @param value The value of the request parameter being added. Set to nil if parameter doesn't contains value.
 @param requestHeader The name of the request header.
 */
- (void)setValue:(nullable NSString *)value forRequestHeader:(NSString *)requestHeader;

/**
 Set an additional request parameter to be included in the pre-signed URL. Adding additional request parameters enables more advanced pre-signed URLs, such as accessing Amazon S3's torrent resource for an object, or for specifying a version ID when accessing an object.

 @param value The value of the request parameter being added. Set to nil if parameter doesn't contains value.
 @param requestParameter The name of the request parameter, as it appears in the URL's query string (e.g. AWSS3PresignedURLVersionID).
 */
- (void)setValue:(nullable NSString *)value forRequestParameter:(NSString *)requestParameter;

@end

/**
 The expression object for configuring a upload task.
 */
@interface AWSS3TransferUtilityUploadExpression : AWSS3TransferUtilityExpression

/**
 The upload request header for `Content-MD5`.
 */
@property (nonatomic, nullable) NSString *contentMD5;

@end

/**
 The expression object for configuring a download task.
 */
@interface AWSS3TransferUtilityDownloadExpression : AWSS3TransferUtilityExpression

@end

NS_ASSUME_NONNULL_END
