//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
//

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSCognitoHandlers.h"
#import "AWSCognitoSyncService.h"

@class AWSCognitoDataset;
@class AWSCognitoCredentialsProvider;
@class AWSTask;

@interface AWSCognito : AWSService

/**
 Posted when the synchronization is started.
 The notification sender is an instance of AWSCognitoClient. The userInfo
 contains the dataset name.
 @discussion This notification is posted once per synchronization.
 The notification is posted on the Grand Central Dispatch
 DISPATCH_QUEUE_PRIORITY_DEFAULT queue. The user interface should not be
 modified on the thread.
 */
extern NSString *const AWSCognitoDidStartSynchronizeNotification;
/**
 Posted when the synchronization is finished with or without errors.
 The notification sender is an instance of AWSCognitoClient. The userInfo
 contains the dataset name.
 @discussion This notification is posted once per synchronization.
 The notification is posted on the Grand Central Dispatch
 DISPATCH_QUEUE_PRIORITY_DEFAULT queue. The user interface should not be
 modified on the thread.
 */
extern NSString *const AWSCognitoDidEndSynchronizeNotification;
/**
 Posted when values are changed to the value from the remote data store. The notification
 sender is an instance of AWSCognitoClient. The userInfo contains the dataset name and
 an NSArray of changed keys.
 @discussion This notification may be posted multiple times per synchronization.
 The notification is posted on the Grand Central Dispatch
 DISPATCH_QUEUE_PRIORITY_DEFAULT queue. The user interface should not be
 modified on the thread.
 */
extern NSString *const AWSCognitoDidChangeLocalValueFromRemoteNotification;
/**
 Posted when locally changed values are pushed to the remote store. The notification
 sender is an instance of AWSCognitoClient. The userInfo contains the dataset name and
 an NSArray of changed keys.
 @discussion This notification may be posted multiple times per synchronization.
 The notification is posted on the Grand Central Dispatch
 DISPATCH_QUEUE_PRIORITY_DEFAULT queue. The user interface should not be
 modified on the thread.
 */
extern NSString *const AWSCognitoDidChangeRemoteValueNotification;
/**
 Posted when the synchronization for the for the dataset failed. The notification
 sender is an instance of AWSCognitoClient. The userInfo contains the dataset name
 and error.
 @discussion This notification may be posted multiple times per synchronization.
 The notification is posted on the Grand Central Dispatch
 DISPATCH_QUEUE_PRIORITY_DEFAULT queue. The user interface should not be
 modified on the thread.
 */
extern NSString *const AWSCognitoDidFailToSynchronizeNotification;

/**
 The error domain for AWSCognito errors.
 <ul>
 <li>AWSCognitoErrorUnknown - Unknow error.</li>
 <li>AWSCognitoErrorRemoteDataStorageFailed - The Amazon Cognito call temporarily failed.</li>
 <li>AWSCognitoErrorInvalidDataValue - The Amazon Cognito call failed. The value for the
 key is invalid and has been deleted from the local database.</li>
 <li>AWSCognitoErrorDataSizeLimitExceeded - The Amazon Cognito call failed. A
 dataset has exceeded the max dataset size.</li>
 <li>AWSCognitoErrorLocalDataStorageFailed - The SQLite call failed.</li>
 <li>AWSCognitoErrorIllegalArgument - The input value is invalid.</li>
 <li>AWSCognitoErrorConflictRetriesExhausted - The number of attempts to resolve a conflict
 has exceeded the max number of retries.</li>
 <li>AWSCognitoErrorWiFiNotAvailable - WiFi is required and not currently available.</li>
 <li>AWSCognitoErrorDeviceNotRegistered - The device has not been registered yet.</li>
 <li>AWSCognitoErrorSyncAlreadyPending - This sync is unecessary, there is already a pending sync.</li>
 <li>AWSCognitoErrorTimedOutWaitingForInFlightSync - There is a in flight sync that took over 5 minutes to complete, so this one was cancelled.</li>
 </ul>
 */
FOUNDATION_EXPORT NSString *const AWSCognitoErrorDomain;
typedef NS_ENUM(NSInteger, AWSCognitoErrorType) {
    AWSCognitoErrorUnknown = 0,
    AWSCognitoErrorRemoteDataStorageFailed = -1000,
    AWSCognitoErrorInvalidDataValue = -1001,
    AWSCognitoErrorUserDataSizeLimitExceeded = -1002,
    AWSCognitoErrorLocalDataStorageFailed = -2000,
    AWSCognitoErrorIllegalArgument = -3000,
    AWSCognitoAuthenticationFailed = -4000,
    AWSCognitoErrorTaskCanceled = -5000,
    AWSCognitoErrorConflictRetriesExhausted = -6000,
    AWSCognitoErrorWiFiNotAvailable = -7000,
    AWSCognitoErrorDeviceNotRegistered = -8000,
    AWSCognitoErrorSyncAlreadyPending = -9000,
    AWSCognitoErrorTimedOutWaitingForInFlightSync = -10000,
};

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 A conflict resolution handler that will receive calls when there is a
 conflict during a sync operation.  A conflict will occur when both remote and
 local data have been updated since the last sync time.
 When not explicitly set, we will use the default conflict resolution of
 'last writer wins', where the data most recently updated will be persisted.
 This handler will be propagated to any AWSCognitoDataset opened by this client.
 */
@property (nonatomic, strong) AWSCognitoRecordConflictHandler conflictHandler;

/**
 A deleted dataset handler. This handler will be called during a synchronization
 when the remote service indicates that a dataset has been deleted.
 Returning YES from the handler will cause the service to recreate the dataset
 on the remote on the next synchronization. Returning NO or leaving this property
 nil will cause the client to delete the dataset locally.
 This handler will be propagated to any AWSCognitoDataset opened by this client.
 */
@property (nonatomic, strong) AWSCognitoDatasetDeletedHandler datasetDeletedHandler;

/**
 A merged dataset handler. This handler will be called during a synchronization
 when the remote service indicates that other datasets should be merged with this one.
 Merged datasets should be fetched, their data overlayed locally and then removed.
 Failing to implement this handler will result in merged datasets remaining on the
 service indefinitely.
 This handler will be propagated to any AWSCognitoDataset opened by this client.
 */
@property (nonatomic, strong) AWSCognitoDatasetMergedHandler datasetMergedHandler;

/**
 The identifier used for this client in Amazon Cognito.  If not supplied
 Amazon Cognito will create a random GUID for the device.
 */
@property (nonatomic, strong) NSString *deviceId;

/**
 The number of times to attempt a synchronization before failing. This will
 be set on any AWSCognitoDatasets opened with this client. Defaults to 5 if not set.
 */
@property (nonatomic, assign) uint32_t synchronizeRetries;

/**
 Only synchronize if device is on a WiFi network. Defaults to NO if not set.
 */
@property (nonatomic, assign) BOOL synchronizeOnWiFiOnly;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually. Returns `nil` if the credentials provider is not an instance of `AWSCognitoCredentials` provider.

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

     let Cognito = AWSCognito.defaultCognito()

 *Objective-C*

     AWSCognito *Cognito = [AWSCognito defaultCognito];

 @return The default service client.
 */
+ (instancetype)defaultCognito;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCognito.registerCognitoWithConfiguration(configuration, forKey: "USWest2Cognito")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCognito registerCognitoWithConfiguration:configuration forKey:@"USWest2Cognito"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Cognito = AWSCognito(forKey: "USWest2Cognito")

 *Objective-C*

     AWSCognito *Cognito = [AWSCognito CognitoForKey:@"USWest2Cognito"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCognitoWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCognitoWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCognito.registerCognitoWithConfiguration(configuration, forKey: "USWest2Cognito")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCognito registerCognitoWithConfiguration:configuration forKey:@"USWest2Cognito"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Cognito = AWSCognito(forKey: "USWest2Cognito")

 *Objective-C*

     AWSCognito *Cognito = [AWSCognito CognitoForKey:@"USWest2Cognito"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CognitoForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCognitoForKey:(NSString *)key;

/**
 Opens an existing dataset or creates a new one.
 
 @return handle to AWSCognitoDataset
 */
- (AWSCognitoDataset *)openOrCreateDataset:(NSString *)datasetName;

/**
 List all datasets our client is aware of. Call refreshDatasetMetadata to ensure
 the client has knowledge of all datasets available on the remote store.
 
 @return NSArray of AWSCognitoDatasetMetadata
 */
- (NSArray *)listDatasets;

/**
 List all of the datasets.  Returns a AWSTask. The result of this task will be an array of 
 AWSCognitoDatasetMetadata objects.
 */
- (AWSTask *)refreshDatasetMetadata;

/**
 Wipe all cached data.
 */
- (void)wipe;

/**
 Get the default, last writer wins conflict handler
 */
+ (AWSCognitoRecordConflictHandler) defaultConflictHandler;

/**
 Register this device for push notifications.  You will not receive any notifications until you actually subscribe the
 dataset you want to receive push notifications for.  If your build targets Release, this will register the device
 with APNS, if your build targets Debug this will register the device with APNS_SANDBOX. Returns a AWSTask.
 The result of this task will be a AWSCognitoSyncRegisterDeviceResponse.
 */
- (AWSTask *)registerDevice: (NSData *) deviceToken;

/**
 Get the device id Cognito Sync gave this device. nil if device has never been registered
 */
+ (NSString *) cognitoDeviceId;

/**
 Used to override the platform for push notifications. If you are not using the CocoaPods distribution,
 #ifdef DEBUG
  [[AWSCognito defaultCognito] setPushPlatform:AWSCognitoSyncPlatformApnsSandbox];
 #endif
 will set push notifications to use the APNS_SANDBOX if your build targets Debug.  Otherwise it will
 always use APNS.
 */

+ (void)setPushPlatform:(AWSCognitoSyncPlatform) pushPlatform;

/**
 The push platform for push notifications
 */
+ (AWSCognitoSyncPlatform)pushPlatform;

/**
 Subscribe to a list of datasets.  Make sure you have called synchronize on each of the datasets in the list
 at least once prior to calling this. Returns a AWSTask.  The result of this task will be a NSArray of
 AWSCognitoSyncSubscribeToDatasetResponse
 */
- (AWSTask *)subscribe:(NSArray *) datasetNames;

/**
 Subscribe to all datasets you have locally.  Make sure you have called synchronize on all of your local datasets
 at least once prior to calling this. Returns a AWSTask.  The result of this task will be a NSArray of
 AWSCognitoSyncSubscribeToDatasetResponse
 */
- (AWSTask *)subscribeAll;

/**
 Unsubscribe to a list of datasets. Returns a AWSTask.  The result of this task will be a NSArray of
 AWSCognitoSyncUnsubscribeToDatasetResponse
 */
- (AWSTask *)unsubscribe:(NSArray *) datasetNames;

/**
 Unsubscribe to all datasets you have locally.  Make sure you have called synchronize on all of your local datasets
 at least once prior to calling this. Returns a AWSTask.  The result of this task will be a NSArray of
 AWSCognitoSyncUnsubscribeToDatasetResponse
 */
- (AWSTask *)unsubscribeAll;

@end
