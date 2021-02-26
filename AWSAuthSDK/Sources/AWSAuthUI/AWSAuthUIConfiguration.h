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

#define AWSAuthUIConfiguration_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AWSAuthCore/AWSSignInButtonView.h>
#import <AWSAuthCore/AWSUIConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

/**
 The `AWSAuthUIConfiguration` class defines the configuration information
 that can be customized on the SignIn screen
 
 1. Logo Image
 2. Background Color
 3. Enable/Disable UserPools UI
 4. SignInButtons
 
 **/
@interface AWSAuthUIConfiguration: NSObject<AWSUIConfiguration>

/**
 @property canCancel
 @brief If set to `YES` user can hit cancel button to dismiss sign in UI.
 **/
@property (atomic) BOOL canCancel;

/**
 @property logoImage
 @brief The logo to be used on the Auth UI Screen.
 **/
@property (nonatomic, nullable) UIImage *logoImage;

/**
 @property backgroundColor
 @brief The background color of the auth screens.
 **/
@property (nonatomic, nullable) UIColor *backgroundColor;

/**
 @property secondaryBackgroundColor
 @brief The secondary background color. It's applied to the bottom panel
 of the auth screens.
 */
@property (nonatomic, nullable) UIColor *secondaryBackgroundColor;

/**
 @property primaryColor
 @brief The view primary color used for highlighted elements (button background, links).
 */
@property (nonatomic, nullable) UIColor *primaryColor;

/**
 @property enableUserPoolsUI
 @brief Enables the User Pools UI Flows for Sign In, Create Account and Forgot Password
 **/
@property (atomic) BOOL enableUserPoolsUI;

/**
 @property isBackgroundColorFullScreen
 @brief Gets the backgorund color of the sign in screen configured by the user for the whole screen.
 **/
@property (nonatomic) BOOL isBackgroundColorFullScreen;

/**
 @property disableSignUpButton
 @brief If set to `YES` the sign up button is hidden from the UI.
 **/
@property (atomic) BOOL disableSignUpButton;

/**
 @property font
 @brief Font for the text in the SignInView and all its subviews.
 **/
@property (nonatomic, nullable) UIFont *font;


/**
 Registers the shared instance of sign in provider implementing `AWSSignInProvider`.
 
 @param     signInButtonViewClass    The SignInButtonView that conforms to the `AWSSignInButtonView` protocol.
 **/
- (void)addAWSSignInButtonViewClass:(_Nonnull Class<AWSSignInButtonView>)signInButtonViewClass
            NS_SWIFT_NAME(addSignInButtonView(class:));

@end

NS_ASSUME_NONNULL_END
