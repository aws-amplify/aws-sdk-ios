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

#import <UIKit/UIKit.h>
#import <AWSCore/AWSCore.h>
#import "AWSS3Service.h"
#import "AWSS3TransferUtilityTasks.h"

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
@class AWSS3TransferUtilityMultiPartUploadTask;
@class AWSS3TransferUtilityDownloadTask;
@class AWSS3TransferUtilityExpression;
@class AWSS3TransferUtilityUploadExpression;
@class AWSS3TransferUtilityMultiPartUploadExpression;
@class AWSS3TransferUtilityDownloadExpression;

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
 
 let S3TransferUtility = AWSS3TransferUtility.default() { (error) in
 
 }
 
 *Objective-C*
 
 AWSS3TransferUtility *S3TransferUtility = [AWSS3TransferUtility defaultS3TransferUtility:^(NSError * _Nullable error) {
 
 }];
 
 @param completionHandler The completion handler to call when the TransferUtility finishes loading transfers from prior sessions.
 @return The default service client.
 */
+ (instancetype)defaultS3TransferUtility:(nullable void (^)(NSError *_Nullable error)) completionHandler
  NS_SWIFT_NAME(default(completionHandler:));


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

 [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration forKey:@"USWest2S3TransferUtility" completionHandler:^(NSError * _Nullable error) {
 
 }];

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
 AWSS3TransferUtility.register(with: configuration!, forKey: "USWest2S3TransferUtility"){ (error) in
 
 }
 
 return true
 }
 
 *Objective-C*
 
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
 identityPoolId:@"YourIdentityPoolId"];
 AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
 credentialsProvider:credentialsProvider];
 
 [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration forKey:@"USWest2S3TransferUtility" completionHandler:^(NSError * _Nullable error) {
 
 }];
 
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
 @param completionHandler The completion handler to call when the TransferUtility finishes loading transfers from prior sessions.
 */
+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration
                                            forKey:(NSString *)key
                                 completionHandler:(nullable void (^)(NSError *_Nullable error)) completionHandler;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSS3TransferUtility.register(with: configuration!, transferUtilityConfiguration: nil, forKey: "USWest2S3TransferUtility") { (error) in
 
         }
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
 Creates a service client with the given service configuration and registers it for the key.
 
 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*
 
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
 let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
 AWSS3TransferUtility.register(with: configuration!, transferUtilityConfiguration: nil, forKey: "USWest2S3TransferUtility") { (error) in
 
 }
 
 return true
 }
 
 *Objective-C*
 
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
 identityPoolId:@"YourIdentityPoolId"];
 AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
 credentialsProvider:credentialsProvider];
 
 [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration transferUtilityConfiguration:nil forKey:@"USWest2S3TransferUtility" completionHandler:^(NSError * _Nullable error) {
 
 }];
 
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
 @param completionHandler The completion handler to call when the TransferUtility finishes loading transfers from prior sessions.
 */
+ (void)registerS3TransferUtilityWithConfiguration:(AWSServiceConfiguration *)configuration
                      transferUtilityConfiguration:(nullable AWSS3TransferUtilityConfiguration *)transferUtilityConfiguration
                                            forKey:(NSString *)key
                                 completionHandler:(nullable void (^)(NSError *_Nullable error)) completionHandler;
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
 Tells `AWSS3TransferUtility` that events related to a URL session are waiting to be processed. This method needs to be called in the `- application:handleEventsForBackgroundURLSession:completionHandler:` application delegate for `AWSS3TransferUtility` to work.

 @param application       The singleton app object.
 @param identifier        The identifier of the URL session requiring attention.
 @param completionHandler The completion handler to call when you finish processing the events.
 */
+ (void)interceptApplication:(UIApplication *)application
handleEventsForBackgroundURLSession:(NSString *)identifier
           completionHandler:(void (^)(void))completionHandler;


/**
 Saves the `NSData` to a temporary directory and uploads it to the configured Amazon S3 bucket in `AWSS3TransferUtilityConfiguration`.
 
 @param data              The data to upload.
 @param key               The Amazon S3 object key name.
 @param contentType       `Content-Type` of the data.
 @param expression        The container object to configure the upload request.
 @param completionHandler The completion handler when the upload completes.
 
 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityUploadTask`.
 */
- (AWSTask<AWSS3TransferUtilityUploadTask *> *)uploadData:(NSData *)data
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(nullable AWSS3TransferUtilityUploadExpression *)expression
                                        completionHandler:(nullable AWSS3TransferUtilityUploadCompletionHandlerBlock)completionHandler;

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
 Uploads the file to the configured Amazon S3 bucket in `AWSS3TransferUtilityConfiguration`.
 
 @param fileURL           The file URL of the file to upload.
 @param key               The Amazon S3 object key name.
 @param contentType       `Content-Type` of the file.
 @param expression        The container object to configure the upload request.
 @param completionHandler The completion handler when the upload completes.
 
 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityUploadTask`.
 */
- (AWSTask<AWSS3TransferUtilityUploadTask *> *)uploadFile:(NSURL *)fileURL
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
 Saves the `NSData` to a temporary directory and uploads it to the configured Amazon S3 bucket in `AWSS3TransferUtilityConfiguration` using Multipart.
 
 @param data              The data to upload.
 @param key               The Amazon S3 object key name.
 @param contentType       `Content-Type` of the data.
 @param expression        The container object to configure the upload request.
 @param completionHandler The completion handler when the upload completes.
 
 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityMultiPartUploadTask`.
 */
- (AWSTask<AWSS3TransferUtilityMultiPartUploadTask *> *)uploadDataUsingMultiPart:(NSData *)data
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(nullable AWSS3TransferUtilityMultiPartUploadExpression *)expression
                                        completionHandler:(nullable AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler
                                        NS_SWIFT_NAME(uploadUsingMultiPart(data:key:contentType:expression:completionHandler:));

/**
 Saves the `NSData` to a temporary directory and uploads it to the specified Amazon S3 bucket using Multipart.
 
 @param data              The data to upload.
 @param bucket            The Amazon S3 bucket name.
 @param key               The Amazon S3 object key name.
 @param contentType       `Content-Type` of the data.
 @param expression        The container object to configure the upload request.
 @param completionHandler The completion handler when the upload completes.
 
 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityMultiPartUploadTask`.
 */
- (AWSTask<AWSS3TransferUtilityMultiPartUploadTask *> *)uploadDataUsingMultiPart:(NSData *)data
                                                   bucket:(NSString *)bucket
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(nullable AWSS3TransferUtilityMultiPartUploadExpression *)expression
                                        completionHandler:(nullable AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler
                                        NS_SWIFT_NAME(uploadUsingMultiPart(data:bucket:key:contentType:expression:completionHandler:));

/**
 Uploads the file to the configured Amazon S3 bucket in `AWSS3TransferUtilityConfiguration` using MultiPart.
 
 @param fileURL           The file URL of the file to upload.
 @param key               The Amazon S3 object key name.
 @param contentType       `Content-Type` of the file.
 @param expression        The container object to configure the upload request.
 @param completionHandler The completion handler when the upload completes.
 
 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityMultiPartUploadTask`.
 */
- (AWSTask<AWSS3TransferUtilityMultiPartUploadTask *> *)uploadFileUsingMultiPart:(NSURL *)fileURL
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(nullable AWSS3TransferUtilityMultiPartUploadExpression *)expression
                                            completionHandler:(nullable AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler
                                        NS_SWIFT_NAME(uploadUsingMultiPart(fileURL:key:contentType:expression:completionHandler:));


/**
 Uploads the file to the specified Amazon S3 bucket using MultiPart.
 
 @param fileURL           The file URL of the file to upload.
 @param bucket            The Amazon S3 bucket name.
 @param key               The Amazon S3 object key name.
 @param contentType       `Content-Type` of the file.
 @param expression        The container object to configure the upload request.
 @param completionHandler The completion handler when the upload completes.
 
 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityMultiPartUploadTask`.
 */
- (AWSTask<AWSS3TransferUtilityMultiPartUploadTask *> *)uploadFileUsingMultiPart:(NSURL *)fileURL
                                                   bucket:(NSString *)bucket
                                                      key:(NSString *)key
                                              contentType:(NSString *)contentType
                                               expression:(nullable AWSS3TransferUtilityMultiPartUploadExpression *)expression
                                        completionHandler:(nullable AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock)completionHandler
                                        NS_SWIFT_NAME(uploadUsingMultiPart(fileURL:bucket:key:contentType:expression:completionHandler:));



/**
 Downloads the specified Amazon S3 object as `NSData` from the bucket configured in `AWSS3TransferUtilityConfiguration`.
 
 @param key               The Amazon S3 object key name.
 @param expression        The container object to configure the download request.
 @param completionHandler The completion handler when the download completes.
 
 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityDownloadTask`.
 */
- (AWSTask<AWSS3TransferUtilityDownloadTask *> *)downloadDataForKey:(NSString *)key
                                                         expression:(nullable AWSS3TransferUtilityDownloadExpression *)expression
                                                  completionHandler:(nullable AWSS3TransferUtilityDownloadCompletionHandlerBlock)completionHandler;

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
 Downloads the specified Amazon S3 object to a file URL from the bucket configured in `AWSS3TransferUtilityConfiguration`.
 
 @param fileURL           The file URL to download the object to.
 @param key               The Amazon S3 object key name.
 @param expression        The container object to configure the download request.
 @param completionHandler The completion handler when the download completes.
 
 @return Returns an instance of `AWSTask`. On successful initialization, `task.result` contains an instance of `AWSS3TransferUtilityDownloadTask`.
 */
- (AWSTask<AWSS3TransferUtilityDownloadTask *> *)downloadToURL:(NSURL *)fileURL
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

 @param uploadBlocksAssigner   The block for assigning the upload progress feedback and completion handler blocks.
 @param downloadBlocksAssigner The block for assigning the download progress feedback and completion handler blocks.
 */
- (void)enumerateToAssignBlocksForUploadTask:(nullable void (^)(AWSS3TransferUtilityUploadTask *uploadTask,
                                                                _Nullable AWSS3TransferUtilityProgressBlock * _Nullable uploadProgressBlockReference,
                                                                _Nullable AWSS3TransferUtilityUploadCompletionHandlerBlock * _Nullable completionHandlerReference))uploadBlocksAssigner
                                downloadTask:(nullable void (^)(AWSS3TransferUtilityDownloadTask *downloadTask,
                                                                _Nullable AWSS3TransferUtilityProgressBlock * _Nullable downloadProgressBlockReference,
                                                                _Nullable AWSS3TransferUtilityDownloadCompletionHandlerBlock * _Nullable completionHandlerReference))downloadBlocksAssigner;

/**
 Assigns progress feedback and completion handler blocks. This method should be called when the app was suspended while the transfer is still happening.
 
 @param uploadBlocksAssigner   The block for assigning the upload progress feedback and completion handler blocks.
 @param multiPartUploadBlocksAssigner The block for assigning the multipart upload progress feedback and completion handler blocks.
 @param downloadBlocksAssigner The block for assigning the download progress feedback and completion handler blocks.
 */
-(void)enumerateToAssignBlocksForUploadTask:(void (^)(AWSS3TransferUtilityUploadTask *uploadTask,
                                                      AWSS3TransferUtilityProgressBlock _Nullable * _Nullable uploadProgressBlockReference,
                                                      AWSS3TransferUtilityUploadCompletionHandlerBlock _Nullable * _Nullable completionHandlerReference))uploadBlocksAssigner
              multiPartUploadBlocksAssigner: (void (^) (AWSS3TransferUtilityMultiPartUploadTask *multiPartUploadTask,
                                                        AWSS3TransferUtilityMultiPartProgressBlock _Nullable * _Nullable multiPartUploadProgressBlockReference,
                                                        AWSS3TransferUtilityMultiPartUploadCompletionHandlerBlock _Nullable * _Nullable completionHandlerReference)) multiPartUploadBlocksAssigner
                     downloadBlocksAssigner:(void (^)(AWSS3TransferUtilityDownloadTask *downloadTask,
                                                      AWSS3TransferUtilityProgressBlock _Nullable * _Nullable downloadProgressBlockReference,
                                                      AWSS3TransferUtilityDownloadCompletionHandlerBlock _Nullable * _Nullable completionHandlerReference))downloadBlocksAssigner;

/**
 Retrieves all running tasks.
 @deprecated Use `getUploadTasks:, getMultiPartUploadTasks: and getDownloadTasks:` methods instead.
 @return An array of containing `AWSS3TransferUtilityUploadTask` and `AWSS3TransferUtilityDownloadTask` objects.
 */
- (AWSTask<NSArray<__kindof AWSS3TransferUtilityTask *> *> *)getAllTasks __attribute((deprecated));

/**
 Retrieves all running upload tasks.

 @return An array of `AWSS3TransferUtilityUploadTask`.
 */
- (AWSTask<NSArray<AWSS3TransferUtilityUploadTask *> *> *)getUploadTasks;

/**
 Retrieves all running MultiPart upload tasks.
 
 @return An array of `AWSS3TransferUtilityMultiPartUploadTask`.
 */
- (AWSTask<NSArray<AWSS3TransferUtilityMultiPartUploadTask *> *> *)getMultiPartUploadTasks;

/**
 Retrieves all running download tasks.

 @return An array of `AWSS3TransferUtilityDownloadTask`.
 */
- (AWSTask<NSArray<AWSS3TransferUtilityDownloadTask *> *> *)getDownloadTasks;

@end

#pragma mark - AWSS3TransferUtilityConfiguration

@interface AWSS3TransferUtilityConfiguration : NSObject <NSCopying>

@property (nonatomic, assign, getter=isAccelerateModeEnabled) BOOL accelerateModeEnabled;

@property (nonatomic, nullable, copy) NSString *bucket;

@property NSInteger retryLimit;

@property (nonatomic, nullable) NSNumber *multiPartConcurrencyLimit;

@property NSInteger timeoutIntervalForResource;

@end

NS_ASSUME_NONNULL_END
