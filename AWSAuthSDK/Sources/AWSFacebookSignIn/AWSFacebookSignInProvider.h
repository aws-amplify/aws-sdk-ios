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
#import <AWSAuthCore/AWSSignInProvider.h>
#import <AWSAuthCore/AWSSignInProviderApplicationIntercept.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * `AWSFacebookSignInProvider` adopts the `AWSSignInProvider` protocol.
 *
 * It works with the FacebookLoginSDK internally and uses the Facebook App ID specified in the info.plist file.
 */
@interface AWSFacebookSignInProvider : NSObject <AWSSignInProvider, AWSSignInProviderApplicationIntercept>

/**
 Fetches the singleton instance of AWSFacebookSignInProvider.
 
 @return the singleton instance of AWSFacebookSignInProvider
 */
+ (instancetype)sharedInstance;

/**
 Sets the login behavior of the Facebook SignIn SDK.
 Choices are listed in enum FBSDKLoginBehavior.
 Default behaviors for iOS:
 9+ SFSafariViewController used.
 8  WebViewController used.
 @loginBehavior a FBSDKLoginBehavior enum entry
 */
- (void)setLoginBehavior:(NSUInteger)loginBehavior;

/**
 Sets the permissions requested during login.
 Default behavior is no permissions are required.
 */
- (void)setPermissions:(NSArray *)permissions;

/**
 Sets the ViewController used for Facebook SignIn.
 Defaults to nil and handled by Facebook SDK.
 */
- (void)setViewControllerForFacebookSignIn:(UIViewController *)signInViewController;

@end

NS_ASSUME_NONNULL_END