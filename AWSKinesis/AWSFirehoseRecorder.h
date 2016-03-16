//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSCore/AWSTask.h>
#import "AWSAbstractKinesisRecorder.h"

FOUNDATION_EXPORT NSString *const AWSFirehoseRecorderErrorDomain;

typedef NS_ENUM(NSInteger, AWSFirehoseRecorderErrorType) {
    AWSFirehoseRecorderErrorUnknown,
    AWSFirehoseRecorderErrorDataTooLarge,
};

/**
 When a `saveRecord:streamName:` operation causes the disk size to exceed `notificationByteThreshold`, it posts `AWSFirehoseRecorderByteThresholdReachedNotification`.
 */
FOUNDATION_EXPORT NSString *const AWSFirehoseRecorderByteThresholdReachedNotification;

/**
 You can retrieve the disk bytes used from the `notification.userInfo` dictionary with this key.
 */
FOUNDATION_EXPORT NSString *const AWSFirehoseRecorderByteThresholdReachedNotificationDiskBytesUsedKey;


/**
  The AWSFirehoseRecorder is a high level client meant for storing put record requests on the user's device. This allows developers to retain requests when the device is offline. It can also increase performance and battery efficiency since the Wi-Fi or cell network does not need to be woken up as frequently.
 @discussion AWSFirehoseRecorder stores the requests unencripted and does not perform additional security measures outside of what the iOS offers by default. Therefore, it is recommended not to store highly sensitive information using AWSFirehoseRecorder.
 */
@interface AWSFirehoseRecorder : AWSAbstractKinesisRecorder

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

     let FirehoseRecorder = AWSFirehoseRecorder.defaultFirehoseRecorder()

 *Objective-C*

     AWSFirehoseRecorder *FirehoseRecorder = [AWSFirehoseRecorder defaultFirehoseRecorder];

 @return A shared instance of this service client.
 */
+ (instancetype)defaultFirehoseRecorder;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSFirehoseRecorder.registerFirehoseRecorderWithConfiguration(configuration, forKey: "USWest2FirehoseRecorder")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSFirehoseRecorder registerFirehoseRecorderWithConfiguration:configuration forKey:@"USWest2FirehoseRecorder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let FirehoseRecorder = AWSFirehoseRecorder(forKey: "USWest2FirehoseRecorder")

 *Objective-C*

     AWSFirehoseRecorder *FirehoseRecorder = [AWSFirehoseRecorder FirehoseRecorderForKey:@"USWest2FirehoseRecorder"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerFirehoseRecorderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerFirehoseWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSFirehoseRecorder.registerFirehoseRecorderWithConfiguration(configuration, forKey: "USWest2FirehoseRecorder")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSFirehoseRecorder registerFirehoseRecorderWithConfiguration:configuration forKey:@"USWest2FirehoseRecorder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let FirehoseRecorder = AWSFirehoseRecorder(forKey: "USWest2FirehoseRecorder")

 *Objective-C*

     AWSFirehoseRecorder *FirehoseRecorder = [AWSFirehoseRecorder FirehoseRecorderForKey:@"USWest2FirehoseRecorder"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)FirehoseRecorderForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 @warning Before calling this method, make sure no method is running on this client.

 @param key A string to identify the service client.
 */
+ (void)removeFirehoseRecorderForKey:(NSString *)key;

@end
