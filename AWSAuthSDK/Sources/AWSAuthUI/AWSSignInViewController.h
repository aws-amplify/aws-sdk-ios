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

#import <UIKit/UIKit.h>
#import <AWSAuthCore/AWSSignInButtonView.h>
#import "AWSAuthUIConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSSignInViewController : UIViewController

/**
 @property canCancel
 @brief If set to `YES` user can hit cancel button to dismiss sign in UI
 **/
@property (atomic) BOOL canCancel;

/**
 @property signInButton
 @brief UIButton that kicks off the SignIn flow on click
 **/
@property (weak, nonatomic) IBOutlet UIButton *signInButton;

/**
 @property signUpButton
 @brief UIButton that kicks off the SignUp flow on click
 **/
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

/**
 @property forgotPasswordButton
 @brief UIButton that kicks off the ForgotPassword flow on click
 **/
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordButton;

/**
 @property orSignInWithLabel
 @brief Text Label that displays "or sign in with" when userpools
        and one or more SignIn Buttons are configured
 **/
@property (weak, nonatomic) IBOutlet UILabel *orSignInWithLabel;

/**
 @property logoView
 @brief Image View for holding the Logo Image
 **/
@property (weak, nonatomic) IBOutlet UIImageView *logoView;

/**
 @property tableFormView
 @brief The table form view for userpools
 **/
@property (weak, nonatomic) IBOutlet UIView *tableFormView;

/**
 @property tableView
 @brief The table view for userpools
 **/
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/**
 @property logoViewHeight
 @brief Layout constraint for specifying the height of the logo view
 **/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoViewHeight;

/**
 @property completionHandler
 @brief Callback to the application which notifies success/failure of the SignIn
 **/
@property (nonatomic, copy) void (^completionHandler)(id<AWSSignInProvider> signInProvider, NSError * _Nullable error);

/**
 @property config
 @brief Auth UI Confguration
 **/
@property (strong, nonatomic) AWSAuthUIConfiguration *config;

/**
 Creates a new AWSSignInViewController instance
 
 @param     configuration           The AWSAuthUIConfiguration object configured with logo, background color, etc.
 @return    AWSSignInViewController The SignIniewController object initialized with the storyboard
 **/
+ (AWSSignInViewController *)getAWSSignInViewControllerWithconfiguration:(AWSAuthUIConfiguration *)configuration;

@end

NS_ASSUME_NONNULL_END
