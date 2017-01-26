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

#import <Foundation/Foundation.h>

@class AWSPinpoint, AWSServiceConfiguration, AWSPinpointEnvironment;

NS_ASSUME_NONNULL_BEGIN

typedef void(^AWSInitializationCompletionBlock)(AWSPinpoint * _Nonnull pinpoint);

/**
 AWS Pinpoint Configuration. This class is used to configure an instance of the AWSPinpoint class.
 
 You must specify an instance of this class in order to initialize the AWSPinpoint SDK.
 
 You may use the defaultPinpointConfigurationWithLaunchOptions: initializer to default your settings from the `Info.plist` file.
 */
@interface AWSPinpointConfiguration : NSObject

/**
 Custom Attributes that will be added to the Client Context.
 
 @returns A map of attributes.
 */
@property (nonatomic, strong) NSDictionary *_Nullable attributes;

/**
 Represents environment information about the application.
 Defaults to [AWSPinpointEnvironment new]
 
 @returns AWSPinpointEnvironment.
 */
@property (nonatomic, strong) AWSPinpointEnvironment *_Nullable environment;

/**
 Indicates whether or not event collection is enabled for the SDK.
 Defaults to YES.
 
 @returns YES/NO indicating if event collection is enabled
 */
@property (nonatomic, assign) BOOL enableEvents;

/**
 Indicates whether or not targeting and endpoint profile registration is enabled for the SDK.
 Defaults to YES.
 
 @returns YES/NO indicating if event collection is enabled
 */
@property (nonatomic, assign) BOOL enableTargeting;

/**
 Indicates whether or not analytics session events are automatically recorded.
 Defaults to YES.
 
 @returns YES/NO indicating if event collection is enabled
 */
@property (nonatomic, assign) BOOL enableAutoSessionRecording;

/**
 A service configuration object to be used for Pinpoint Analytics.
 Defaults to [AWSServiceManager defaultServiceManager].defaultServiceConfiguration
 
 @returns serviceConfiguration used.
 */
@property (nonatomic, copy) AWSServiceConfiguration *_Nullable serviceConfiguration;

/**
 A service configuration object to be used for Pinpoint Targeting.
 Defaults to [AWSServiceManager defaultServiceManager].defaultServiceConfiguration
 
 @returns pinpointServiceConfiguration used.
 */
@property (nonatomic, copy) AWSServiceConfiguration *_Nullable targetingServiceConfiguration;

/**
 The max storage size to use for event storage.
 Defaults to 5MB.
 
 @returns the Max Storage Size
 */
@property (nonatomic, assign) int maxStorageSize;

/**
 The session timeout in milliseconds.
 Defaults to 5 seconds.
 
 @returns the session timeout.
 */
@property (nonatomic, assign) int sessionTimeout;

/**
 The Pinpoint AppId
 Defaults to the specified `appId` in the `Info.plist`.
 
 @returns the appId
 */
@property (nonatomic, strong) NSString *appId;

/**
 A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly.
 For information about the possible keys in this dictionary and how to handle them, see Launch Options Keys.
 
 @returns the launchOptions
 */
@property (nonatomic, strong) NSDictionary *_Nullable launchOptions;

/**
 A block to be execulted after initialization is complete.
 
 @returns the completionBlock
 */
@property (nonatomic, copy) AWSInitializationCompletionBlock _Nullable completionBlock;

/**
 Creates an `AWSPinpointConfiguration` instance with the specified configuration inside `Info.plist` to configure the AWSPinpoint intializer.
 
 This initializer of AWSPinpoint should be called inside your AppDelegates' application:didFinishLaunchingWithOptions: method.
 
 You must specify the launchOptions returned from  application:didFinishLaunchingWithOptions:
 
 @param launchOptions A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly.
 
 @returns The AWSPinpointConfiguration instance with the specified default appId, serviceConfigurations from `Info.plist`
 */
+ (instancetype) defaultPinpointConfigurationWithLaunchOptions:(nullable NSDictionary*) launchOptions;

/**
 Returns an AWSPinpointConfiguration object with the specified max storage size.
 
 @param appId The Pinpoint Application ID, if nil is passed it defaults to the specified `appId` in the `Info.plist`.
 @param launchOptions A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly.
 @returns an AWSPinpointConfiguration object
 */
- (instancetype) initWithAppId:(NSString*) appId
                 launchOptions:(nullable NSDictionary*) launchOptions;

/**
 Returns an AWSPinpointConfiguration object with the specified max storage size.
 
 @param appId The Pinpoint Application ID, if nil is passed it defaults to the specified `appId` in the `Info.plist`.
 @param launchOptions A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly.
 @param maxStorageSize The max storage size in bytes to use for event storage.
 @param sessionTimeout The amount of time it takes for a session to timeout after being paused.
 @returns an AWSPinpointConfiguration object
 */
- (instancetype) initWithAppId:(NSString*) appId
                 launchOptions:(nullable NSDictionary*) launchOptions
                maxStorageSize:(int) maxStorageSize
                sessionTimeout:(int) sessionTimeout;

@end


/**
 AWS Pinpoint Environment.
 */
@interface AWSPinpointEnvironment : NSObject

/**
 The short version string of the app.
 Defaults to [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
 
 @returns appVersion.
 */
@property (nonatomic, strong) NSString *_Nullable appVersion;

/**
 The bundle version of the app.
 Defaults to [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
 
 @returns appBuild.
 */
@property (nonatomic, strong) NSString *_Nullable appBuild;

/**
 The bundle identifier of the app.
 Defaults to [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
 
 @returns appPackageName.
 */
@property (nonatomic, strong) NSString *_Nullable appPackageName;

/**
 The bundle display name of the app.
 Defaults to [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
 
 @returns appName.
 */
@property (nonatomic, strong) NSString *_Nullable appName;

@end

NS_ASSUME_NONNULL_END

