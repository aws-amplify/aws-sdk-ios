//
// Copyright 2017-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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


NS_ASSUME_NONNULL_BEGIN

@class SignInUIOptions;

/**
 Interface to provide the SignInProvider and permissions.
 */
@interface AWSSignInProviderConfig : NSObject

@property (nonatomic) Class<AWSSignInProvider> signInProviderClass;

@property (nonatomic) NSArray<NSString *> *permissions;

@end

/**
 AWSMobileClient helps you initialize the SDK, fetch the Cognito Identity
 and resume any previously signed-in session. It also registers the SignIn
 providers based on the information provided in awsconfiguration.json file.
 */
@interface _AWSMobileClient : AWSCognitoCredentialsProvider

/**
 Returns the AWSMobileClient singleton instance configured using the information provided in `awsconfiguration.json` or `Info.plist` file.
 
 *Swift*
 
 let mobileClient = AWSMobileClient.default()
 
 *Objective-C*
 
 AWSMobileClient *mobileClient = [AWSMobileClient sharedInstance];
 */
+ (instancetype)sharedInstance;

/**
 Initializes the AWSMobileClient with a custom configuration object. This initializer should be used when custom
 configuration through code is required over the `awsconfiguration.json` file.
 
 **Implementation Notes:**
 
 The `AWSMobileClient` relies on `AWSInfo` for configuration and once that class is initialized,
 the configuration cannot be reset and/or re-initialized. Therefore, even though you can instantiate
 `AWSMobileClient` multiple times, all instances will have the **same** configuration reference.
 */
- (instancetype)initWithConfiguration:(NSDictionary<NSString *, id> *)config;

/**
 Configure third-party services from application delegate with url, application
 that called this provider, and any annotation info.
 
 @param application instance from application delegate.
 @param url called from application delegate.
 @param sourceApplication that triggered this call.
 @param annotation from application delegate.
 @return true if call was handled by this component.
 
 *Swift*
 
 AWSMobileClient
    .sharedInstance()
    .interceptApplication(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
 
 *Objective-C*
 
 AWSMobileClient *mobileClient = [AWSMobileClient sharedInstance];
 [mobileClient interceptApplication:application
                            openURL:url
                  sourceApplication:srcApplication
                         annotation:annotation];
 */
- (BOOL)interceptApplication:(UIApplication *)application
                     openURL:(NSURL *)url
           sourceApplication:(nullable NSString *)sourceApplication
                  annotation:(id)annotation;

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
 Set the signInProviderConfig
 
 @param signInProviderConfig the signInProviderConfiguration with permissions.
 **/
- (void)setSignInProviders:(nullable NSArray<AWSSignInProviderConfig *> *)signInProviderConfig;


-(void)showSignInScreen:(UINavigationController *)navController
  signInUIConfiguration:(SignInUIOptions *)signInUIConfiguration
      completionHandler:(void (^)(NSString * _Nullable signInProviderKey, NSString * _Nullable signInProviderToken, NSError * _Nullable error))completionHandler;

/**
 * Set the CredentialsProvider supplied by the user.
 * @param credentialsProvider The CredentialsProvider supplied by the user
 */
- (void)setCredentialsProvider:(AWSCognitoCredentialsProvider *)credentialsProvider;

/**
 * Retrieve the Credentials Provider.
 * @return AWSCognitoCredentialsProvider
 */
- (AWSCognitoCredentialsProvider *)getCredentialsProvider;

/**
 * Indicates whether the user is signed-in or not.
 * @return true if user is signed-in
 */
@property (nonatomic, readonly, getter=isLoggedIn) BOOL loggedIn;

- (void)updateCognitoCredentialsProvider:(AWSCognitoCredentialsProvider *)cognitoCreds;

- (void)registerConfigSignInProviders;

- (void)setCustomRoleArnInternal:(NSString * _Nullable)customRoleArnInternal
                             for:(AWSCognitoCredentialsProvider *)credsProvider;

@end

NS_ASSUME_NONNULL_END
