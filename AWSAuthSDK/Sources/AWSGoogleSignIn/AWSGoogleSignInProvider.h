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
 * `AWSGoogleSignInProvider` adopts the `AWSSignInProvider` protocol.
 *
 * It works with the Google Sign In SDK internally and requires the Google Client ID provided by Google.
 */
@interface AWSGoogleSignInProvider : NSObject <AWSSignInProvider, AWSSignInProviderApplicationIntercept>

/**
 Fetches the shared instance for AWSGoogleSignInProvider.
 
 @return the single instance of AWSGoogleSignInProvider
 */
+ (instancetype)sharedInstance;

/**
 Sets the scopes required by the app during login.
 Defaults are openid and profile.
 */
- (void)setScopes:(NSArray *)scopes;

/**
 Sets the ViewController used for Google SignIn.
 Defaults to rootViewController in keyWindow during signin.
 */
- (void)setViewControllerForGoogleSignIn:(UIViewController *)signInViewController;

@end

NS_ASSUME_NONNULL_END