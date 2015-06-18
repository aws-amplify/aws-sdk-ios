/*
 * Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSService.h>

@class AWSTask;

FOUNDATION_EXPORT NSString *const AWSKinesisRecorderErrorDomain;

typedef NS_ENUM(NSInteger, AWSKinesisRecorderErrorType) {
    AWSKinesisRecorderErrorUnknown,
    AWSKinesisRecorderErrorDataTooLarge,
};

/**
 When a `saveRecord:streamName:` operation causes the disk size to exceed `notificationByteThreshold`, it posts `AWSKinesisRecorderByteThresholdReachedNotification`.
 */
FOUNDATION_EXPORT NSString *const AWSKinesisRecorderByteThresholdReachedNotification;

/**
 You can retrieve the disk bytes used from the `notification.userInfo` dictionary with this key.
 */
FOUNDATION_EXPORT NSString *const AWSKinesisRecorderByteThresholdReachedNotificationDiskBytesUsedKey;


/**
  The AWSKinesisRecorder is a high level client meant for storing put record requests on the user's device. This allows developers to retain requests when the device is offline. It can also increase performance and battery efficiency since the Wi-Fi or cell network does not need to be woken up as frequently.
 @discussion AWSKinesisRecorder stores the requests unencripted and does not perform additional security measures outside of what the iOS offers by default. Therefore, it is recommended not to store highly sensitive information using AWSKinesisRecorder.
 */
@interface AWSKinesisRecorder : AWSService

/**
 The number of bytes currently used to store AWSKinesisPutRecordInput objects on disk.
 */
@property (nonatomic, assign, readonly) NSUInteger diskBytesUsed;

/**
 The threshold of disk bytes for notification. When exceeded, `saveRecord:streamName:` posts AWSKinesisRecorderByteThresholdReachedNotification. The default is 0 meaning it will not post the notification.
 @discussion The `notificationByteThreshold` should be smaller than `diskByteLimit`.
 */
@property (nonatomic, assign) NSUInteger notificationByteThreshold;

/**
 The limit of the disk cache size in bytes. When exceeded, older requests will be discarded. Setting this value to 0.0 meaning no practical limit. The default value is 5MB.
 */
@property (nonatomic, assign) NSUInteger diskByteLimit;

/**
 The age limit of the cached requests. When exceeded, requests older than the specified age will be discarded. Setting this value to 0 meaning no practical limit. The default is no age limit.
 */
@property (nonatomic, assign) NSTimeInterval diskAgeLimit;

/**
 Returns a shared instance of this service client using `[AWSServiceManager defaultServiceManager].defaultServiceConfiguration`. When `defaultServiceConfiguration` is not set, this method returns nil.

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

     let KinesisRecorder = AWSKinesisRecorder.defaultKinesisRecorder()

 *Objective-C*

     AWSKinesisRecorder *KinesisRecorder = [AWSKinesisRecorder defaultKinesisRecorder];

 @return A shared instance of this service client.
 */
+ (instancetype)defaultKinesisRecorder;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSKinesisRecorder.registerKinesisRecorderWithConfiguration(configuration, forKey: "USWest2KinesisRecorder")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesisRecorder registerKinesisRecorderWithConfiguration:configuration forKey:@"USWest2KinesisRecorder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KinesisRecorder = AWSKinesisRecorder(forKey: "USWest2KinesisRecorder")

 *Objective-C*

     AWSKinesisRecorder *KinesisRecorder = [AWSKinesisRecorder KinesisRecorderForKey:@"USWest2KinesisRecorder"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerKinesisRecorderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerKinesisWithConfiguration:forKey:` before invoking this method. If `+ registerKinesisWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSKinesisRecorder.registerKinesisRecorderWithConfiguration(configuration, forKey: "USWest2KinesisRecorder")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesisRecorder registerKinesisRecorderWithConfiguration:configuration forKey:@"USWest2KinesisRecorder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KinesisRecorder = AWSKinesisRecorder(forKey: "USWest2KinesisRecorder")

 *Objective-C*

     AWSKinesisRecorder *KinesisRecorder = [AWSKinesisRecorder KinesisRecorderForKey:@"USWest2KinesisRecorder"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)KinesisRecorderForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 @warning Before calling this method, make sure no method is running on this client.

 @param key A string to identify the service client.
 */
+ (void)removeKinesisRecorderForKey:(NSString *)key;

/**
 Returns an instance of this service client using `configuration` and `identifier`.

 @warning This method has been deprecated. Use `+ registerKinesisRecorderWithConfiguration:forKey:` and `+ KinesisRecorderForKey:` instead.

 @param configuration An object to configure the internal `AWSKinesis`. At least `regionType` and `credentialsProvider` need to be set.
 @param identifier    An unique identifier for AWSKinesisRecorder to create a disk cache. Multiple instances with the same identifier are allowed and can safely access the same data on disk.

 @return An instance of this service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
                           identifier:(NSString *)identifier  __attribute__ ((deprecated("Use '+ registerKinesisRecorderWithConfiguration:forKey:' and '+ KinesisRecorderForKey:' instead.")));

/**
 Saves a record to local storage to be sent later. The record will be submitted to the streamName provided with a randomly generated partition key to ensure equal distribution across shards.

 @param data       The data to send to Amazon Kinesis.
 @param streamName The stream name for Amazon Kinesis.

 @return AWSTask- task.result contains an instance of AWSKinesisPutRecordInput persisted.
 */
- (AWSTask *)saveRecord:(NSData *)data
            streamName:(NSString *)streamName;

/**
 Submits all locally saved requests to Amazon Kinesis. Requests that are successfully sent will be deleted from the device. Requests that fail due to the device being offline will stop the submission process and be kept. Requests that fail due to other reasons (such as the request being invalid) will be deleted.

 @return AWSTask - task.result is always nil.
 */
- (AWSTask *)submitAllRecords;

/**
 Removes all requests saved to disk.

 @return AWSTask- task.result is always nil.
 */
- (AWSTask *)removeAllRecords;

@end
