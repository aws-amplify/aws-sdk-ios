/*
 Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at
 
 http://aws.amazon.com/apache2.0
 
 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AWSPinpoint;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const AWSDeviceTokenKey;
FOUNDATION_EXPORT NSString * const AWSDataKey;
FOUNDATION_EXPORT NSString * const AWSPinpointKey;
FOUNDATION_EXPORT NSString * const AWSPinpointCampaignKey;
FOUNDATION_EXPORT NSString * const AWSPinpointJourneyKey;

@interface AWSPinpointNotificationManager : NSObject

typedef NS_ENUM(NSInteger, AWSPinpointPushActionType) {
    AWSPinpointPushActionTypeOpened,
    AWSPinpointPushActionTypeReceivedForeground,
    AWSPinpointPushActionTypeReceivedBackground,
    AWSPinpointPushActionTypeUnknown
};

typedef NS_ENUM(NSInteger, AWSPinpointPushEventSourceType) {
    AWSPinpointPushEventSourceTypeCampaign,
    AWSPinpointPushEventSourceTypeJourney,
    AWSPinpointPushEventSourceTypeUnknown
};

#pragma mark - Notification Helpers
/**
 Returns a Boolean indicating whether the app is currently registered for remote notifications.
 @return BOOL YES if the app is registered for remote notifications and received its device token or NO if registration
 has not occurred, has failed, or has been denied by the user.
 */
+ (BOOL)isNotificationEnabled;

#pragma mark - Interceptors
/**
 Invoke this method from the `- application:didFinishLaunchingWithOptions:` application delegate method.
 
 The Pinpoint targeting client must intercept this callback in order to report campaign analytics correctly.
 
 @param launchOptions A dictionary indicating the reason the app was launched (if any). The contents of this dictionary
 may be empty in situations where the user launched the app directly.
 */
- (BOOL)interceptDidFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions;

/**
 Invoke this method from the `- application:didRegisterForRemoteNotificationsWithDeviceToken:` application delegate
 method.
 
 The Pinpoint targeting client must intercept this callback in order to report campaign analytics correctly.
 
 @param deviceToken A token that identifies the device to APNs.
 */
- (void)interceptDidRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

/**
 Invoke this method from the `application(_:didReceiveRemoteNotification:fetchCompletionHandler:)` application delegate
 method.

 The Pinpoint targeting client must intercept this callback in order to report campaign analytics correctly.
 
 @param userInfo    A dictionary that contains information related to the remote notification, potentially including a
 badge number for the app icon, an alert sound, an alert message to display to the user, a notification identifier, and
 custom data. The provider originates it as a JSON-defined dictionary that iOS converts to an `NSDictionary` object; the
 dictionary may contain only property-list objects plus `NSNull`.
 @param handler     The block to execute when the download operation is complete. When calling this block, pass in the
 fetch result value that best describes the results of your download operation. You must call this handler and should do
 so as soon as possible. For a list of possible values, see the UIBackgroundFetchResult type.
 */
- (void)interceptDidReceiveRemoteNotification:(NSDictionary *)userInfo
                       fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))handler __attribute__((deprecated("Replaced by -interceptDidReceiveRemoteNotification:")));

/**
 For iOS 9 and below, invoke this method from the `application(_:didReceiveRemoteNotification:fetchCompletionHandler:)`
 application delegate method.

 For iOS 10 and above, invoke this method from the `userNotificationCenter(_:willPresent:withCompletionHandler:)` and
 `userNotificationCenter(_:didReceive:withCompletionHandler:)` UserNotificationCenter methods. When invoking this method
 from `willPresent`, pass in `notification.request.content.userInfo` as userInfo. When invoking this method on
 `didReceive`, pass in `response.notification.request.content.userInfo` as `userInfo`.

 The Pinpoint targeting client must intercept this callback in order to report campaign analytics correctly.

 @param userInfo    A dictionary that contains information related to the remote notification, potentially including a
 badge number for the app icon, an alert sound, an alert message to display to the user, a notification identifier, and
 custom data. The provider originates it as a JSON-defined dictionary that iOS converts to an `NSDictionary` object; the
 dictionary may contain only property-list objects plus `NSNull`.
 */
- (void)interceptDidReceiveRemoteNotification:(NSDictionary *)userInfo;

/**
 Invoke this method from the `application:didReceiveRemoteNotification:fetchCompletionHandler:shouldHandleNotificationDeepLink:`
 application delegate method.

 The Pinpoint targeting client must intercept this callback in order to report campaign analytics correctly. Optionally
 specify 'shouldHandleNotificationDeepLink' to control whether or not the notification manager should attempt to open
 the remote notification deeplink, if present.

 @param userInfo        A dictionary that contains information related to the remote notification, potentially including
 a badge number for the app icon, an alert sound, an alert message to display to the user, a notification identifier,
 and custom data. The provider originates it as a JSON-defined dictionary that iOS converts to an `NSDictionary` object;
 the dictionary may contain only property-list objects plus `NSNull`.
 @param handler         The block to execute when the download operation is complete. When calling this block, pass in
 the fetch result value that best describes the results of your download operation. You must call this handler and
 should do so as soon as possible. For a list of possible values, see the UIBackgroundFetchResult type.
 @param handleDeepLink  Whether or not notification manager should attempt to open the remote notification deeplink, if
 present
 */
- (void)interceptDidReceiveRemoteNotification:(NSDictionary *)userInfo
                       fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))handler
             shouldHandleNotificationDeepLink:(BOOL) handleDeepLink __attribute__((deprecated("Replaced by -interceptDidReceiveRemoteNotification:shouldHandleNotificationDeepLink:")));

/**
 For iOS 9 and below, intercept the `application(_:didReceiveRemoteNotification:fetchCompletionHandler:)` application
 delegate.

 For iOS 10 and above, invoke this method from the `userNotificationCenter(_:willPresent:withCompletionHandler:)` and
 `userNotificationCenter(_:didReceive:withCompletionHandler:)` UserNotificationCenter methods. When invoking this method
 from `willPresent`, pass in `notification.request.content.userInfo` as userInfo. When invoking this method on
 `didReceive`, pass in `response.notification.request.content.userInfo` as `userInfo`.

 The Pinpoint targeting client must intercept this callback in order to report campaign analytics correctly. Optionally
 specify 'shouldHandleNotificationDeepLink' to control whether or not the notification manager should attempt to open
 the remote notification deeplink, if present.

 @param userInfo        A dictionary that contains information related to the remote notification, potentially including
 a badge number for the app icon, an alert sound, an alert message to display to the user, a notification identifier,
 and custom data. The provider originates it as a JSON-defined dictionary that iOS converts to an `NSDictionary` object;
 the dictionary may contain only property-list objects plus `NSNull`.
 @param handleDeepLink  Whether or not notification manager should attempt to open the remote notification deeplink, if
 present
 */
- (void)interceptDidReceiveRemoteNotification:(NSDictionary *)userInfo
             shouldHandleNotificationDeepLink:(BOOL) handleDeepLink;

@end

NS_ASSUME_NONNULL_END

