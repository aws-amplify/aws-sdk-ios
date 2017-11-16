//
// Copyright 2017-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <UIKit/UIKit.h>

#import <AWSAuthCore/AWSAuthCore.h>

//! Project version number for AWSMobileClient.
FOUNDATION_EXPORT double AWSMobileClientVersionNumber;

//! Project version string for AWSMobileClient.
FOUNDATION_EXPORT const unsigned char AWSMobileClientVersionString[];

NS_ASSUME_NONNULL_BEGIN

/**
 Interface to provide the SignInProvider and permissions.
 */
@interface AWSSignInProviderConfig : NSObject

@property (nonatomic) Class<AWSSignInProvider> signInProviderClass;

@property (nonatomic) NSArray<NSString *> *permissions;

@end

@interface AWSMobileClient : NSObject

/**
 Returns the AWSMobileClient singleton instance configured using the information provided in `awsconfiguration.json` or `Info.plist` file.
 
 *Swift*
 
 let mobileClient = AWSMobileClient.sharedInstance()
 
 *Objective-C*
 
 AWSMobileClient *mobileClient = [AWSMobileClient sharedInstance];
 */
+ (instancetype)sharedInstance;

- (BOOL)interceptApplication:(UIApplication *)application
                     openURL:(NSURL *)url
           sourceApplication:(nullable NSString *)sourceApplication
                  annotation:(id)annotation;

/**
 Configures the different AWSMobile SDK Clientsfrom application delegate with options.
 
 @param application instance from application delegate.
 @param launchOptions from application delegate.
 
 *Swift*
 
 AWSMobileClient
    .sharedInstance()
    .interceptApplication(application, didFinishLaunchingWithOptions:launchOptions)
 
 *Objective-C*
 
 AWSMobileClient *mobileClient = [AWSMobileClient sharedInstance];
 [mobileClient interceptApplication:application
      didFinishLaunchingWithOptions:launchOptions];
 */
- (BOOL)interceptApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions;

/**
 Configures the different AWSMobile SDK Clientsfrom application delegate with options.

 @param application instance from application delegate.
 @param launchOptions from application delegate.
 @param completionHandler completion handler for resuming auth session.
 
 *Swift*
 
 AWSMobileClient
    .sharedInstance()
    .interceptApplication(application,
        didFinishLaunchingWithOptions:launchOptions,
        resumeSessionWithCompletionHandler:completionHandler)
 
 *Objective-C*
 
 AWSMobileClient *mobileClient = [AWSMobileClient sharedInstance];
 [mobileClient interceptApplication:application
      didFinishLaunchingWithOptions:launchOptions
 resumeSessionWithCompletionHandler:completionHandler];
 */
- (BOOL)interceptApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
resumeSessionWithCompletionHandler:(void (^)(id result, NSError *error))completionHandler;

/**
 Set the signInProviderConfig
 
 @param signInProviderConfig the signInProviderConfiguration with permissions.
 **/
- (void)setSignInProviders:(nullable NSArray<AWSSignInProviderConfig *> *)signInProviderConfig;
/**
 * Retrieve the Credentials Provider.
 * @return AWSCognitoCredentialsProvider
 */
- (AWSCognitoCredentialsProvider *)getCredentialsProvider;

/**
 * Set the CredentialsProvider supplied by the user.
 * @param credentialsProvider The CredentialsProvider supplied by the user
 */
- (void)setCredentialsProvider:(AWSCognitoCredentialsProvider *)credentialsProvider;

@end

NS_ASSUME_NONNULL_END
