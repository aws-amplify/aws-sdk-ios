//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AuthenticationServices/AuthenticationServices.h>
#import <AWSAuthCore/AWSSignInProvider.h>

NS_ASSUME_NONNULL_BEGIN

API_AVAILABLE(ios(13.0))
@interface AWSAppleSignInProvider : NSObject<AWSSignInProvider>

/**
 Fetches the shared instance for AWSAppleSignInProvider.

 @return the single instance of AWSAppleSignInProvider
 */
+ (instancetype)sharedInstance;

/**
 Sets the ViewController used for Apple SignIn.
 */
- (void)setViewControllerForAppleSignIn:(UIViewController *)signInViewController;

/**
 Provides access to the ASAuthorizationAppleIDCredential
 Only upon initial SIWA, Apple returns name and email (if requested by scope) in the ASAuthorizationAppleIDCredential
 */
@property (strong, atomic) ASAuthorizationAppleIDCredential *credential;

@end

NS_ASSUME_NONNULL_END
