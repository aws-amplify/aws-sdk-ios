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
#import <UIKit/UIKit.h>

#import "AWSUserPoolSignUpViewController.h"
#import <AWSUserPoolsSignIn/AWSUserPoolsSignIn.h>
#import "AWSFormTableCell.h"
#import "AWSTableInputCell.h"
#import "AWSFormTableDelegate.h"
#import <AWSAuthCore/AWSAuthUIHelper.h>
#import <AWSAuthCore/AWSSignInManager.h>
#import <AWSAuthCore/AWSUIConfiguration.h>


#define NAVIGATION_BAR_HEIGHT 64

static NSString *const SIGNIN_STORYBOARD = @"SignIn";
static NSString *const SIGNIN_VIEW_CONTROLLER_IDENTIFIER = @"SignIn";;
static NSString *const USERPOOLS_UI_OPERATIONS = @"AWSUserPoolsUIOperations";


@interface AWSSignInManager()
    
@property (nonatomic) BOOL pendingSignIn;
@property (strong, atomic) NSString *pendingUsername;
@property (strong, atomic) NSString *pendingPassword;
    
-(void)reSignInWithUsername:(NSString *)username
               password:(NSString *)password;
@end

@interface AWSUserPoolSignUpViewController()

@property (nonatomic, strong) AWSCognitoIdentityUserPool * pool;
@property (nonatomic, strong) NSString* sentTo;
@property (nonatomic, strong) AWSFormTableCell *userNameRow;
@property (nonatomic, strong) AWSFormTableCell *passwordRow;
@property (nonatomic, strong) AWSFormTableCell *passwordConfirmRow;
@property (nonatomic, strong) AWSFormTableCell *phoneNumberRow;
@property (nonatomic, strong) AWSFormTableCell *emailRow;
@property (nonatomic, strong) AWSFormTableDelegate *tableDelegate;
@property (nonatomic) BOOL hidePhoneAndEmailRows;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;
@property (nonatomic) CGPoint viewOrigin;

@end

@interface UserPoolSignUpConfirmationViewController()

@property (nonatomic, strong) NSString* sentTo;
@property (nonatomic, strong) AWSCognitoIdentityUser * user;
@property (nonatomic, strong) AWSFormTableCell *userNameRow;
@property (nonatomic, strong) AWSFormTableCell *confirmationCodeRow;
@property (nonatomic, strong) AWSFormTableDelegate *tableDelegate;

@end

@implementation AWSUserPoolSignUpViewController

id<AWSUIConfiguration> config = nil;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pool = [AWSCognitoIdentityUserPool defaultCognitoIdentityUserPool];
    self.hidePhoneAndEmailRows = true;
    [self setUp];
}

// This is used to dismiss the keyboard, user just has to tap outside the
// user name and password views and it will dismiss
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.phase == UITouchPhaseBegan) {
        [self.view endEditing:YES];
    }
    
    [super touchesBegan:touches withEvent:event];
}

#pragma mark - Utility Methods

- (void)setUp {
    _userNameRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Email" type:InputTypeText];
    _passwordRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Password" type:InputTypePassword];
    _passwordConfirmRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Confirm Password" type:InputTypePassword];
    _emailRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Email" type:InputTypeText];
    _phoneNumberRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Phone Number" type:InputTypeText];
    _tableDelegate = [AWSFormTableDelegate new];
    [self.tableDelegate addCell:self.userNameRow];
    [self.tableDelegate addCell:self.passwordRow];
    if (self.hidePhoneAndEmailRows) {
        [self.tableDelegate addCell:self.passwordConfirmRow];
    } else {
        [self.tableDelegate addCell:self.emailRow];
        [self.tableDelegate addCell:self.phoneNumberRow];
    }
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [AWSAuthUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];

    // set up logo
    [self setUpLogo:self.config.logoImage ?: nil];
    

    // setup button background
    [AWSAuthUIHelper applyPrimaryColorFromConfig:self.config
                                          toView:self.signUpButton];
}

- (void)setUpBackground {
    if ([AWSAuthUIHelper isBackgroundColorFullScreen:self.config]) {
        self.view.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    } else {
        self.view.backgroundColor = [AWSAuthUIHelper getSecondaryBackgroundColor];
    }
    
    self.title = @"Sign Up";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)setUpLogo:(UIImage *)image {
    if (image != nil) {
        self.logoView.image = image;
        self.logoView.contentMode = UIViewContentModeScaleAspectFit;
        [self.logoView setNeedsLayout];
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([@"SignUpConfirmSegue" isEqualToString:segue.identifier]){
        UserPoolSignUpConfirmationViewController *signUpConfirmationViewController = segue.destinationViewController;
        signUpConfirmationViewController.sentTo = self.sentTo;
        signUpConfirmationViewController.config = self.config;
        NSString *userName = [self.tableDelegate getValueForCell:self.userNameRow forTableView:self.tableView];
        signUpConfirmationViewController.user = [self.pool getUser:userName];
    }
}

- (IBAction)onSignInButtonClicked:(id)sender {
 
    // Dismisses the keyboard if open before transitioning to the new storyboard
    [self.view endEditing:YES];
    
    // simply pop back to the sign-in view
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)onSignUpClicked:(id)sender {
    
    // Dismisses the keyboard if open before transitioning to the new storyboard
    [self.view endEditing:YES];

    NSMutableArray * attributes = [NSMutableArray new];
    AWSCognitoIdentityUserAttributeType * phone = [AWSCognitoIdentityUserAttributeType new];
    phone.name = @"phone_number";
    if (self.hidePhoneAndEmailRows) {
        phone.value = @"";
    } else {
        phone.value = [self.tableDelegate getValueForCell:self.phoneNumberRow forTableView:self.tableView];
    }
    AWSCognitoIdentityUserAttributeType * email = [AWSCognitoIdentityUserAttributeType new];
    email.name = @"email";
    if (self.hidePhoneAndEmailRows) {
        email.value = @"";
    } else {
        email.value = [self.tableDelegate getValueForCell:self.emailRow forTableView:self.tableView];
    }
    if(![@"" isEqualToString:phone.value]){
        [attributes addObject:phone];
    }
    if(![@"" isEqualToString:email.value]){
        [attributes addObject:email];
    }
    
    NSString *userName = [self.tableDelegate getValueForCell:self.userNameRow forTableView:self.tableView];
    NSString *password = [self.tableDelegate getValueForCell:self.passwordRow forTableView:self.tableView];
    NSString *passwordConfirm = [self.tableDelegate getValueForCell:self.passwordConfirmRow forTableView:self.tableView];
    if ([userName isEqualToString:@""] || [password isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing Information"
                                                                                 message:@"Please enter a valid email address and password."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
    
    if (![password isEqualToString:passwordConfirm]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Password Mismatch"
                                                                                 message:@"The passwords do not match."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
    
    NSString *phoneNumber = [self.tableDelegate getValueForCell:self.phoneNumberRow forTableView:self.tableView];
    if (phoneNumber.length > 0) {
        if (![phoneNumber hasPrefix:@"+"]) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Invalid format"
                                                                                     message:@"Phone number should begin with country code. E.g. +1992.."
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            [self presentViewController:alertController
                               animated:YES
                             completion:nil];
        }
    }
    
    //sign up the user
    [[self.pool signUp:userName
              password:password
        userAttributes:attributes validationData:nil]
     continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserPoolSignUpResponse *> * _Nonnull task) {
        [[AWSSignInManager sharedInstance] reSignInWithUsername:userName password:password];
        AWSDDLogDebug(@"Successful signUp user: %@",task.result.user.username);
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
                
                // replace poor AWS error messages with user-friendly versions
                NSErrorUserInfoKey errorType = task.error.userInfo[@"__type"];
                NSErrorUserInfoKey errorTitle = @"Sign Up";
                NSErrorUserInfoKey errorMessage = task.error.userInfo[@"message"];
                
                if([errorType  isEqual: @"InvalidParameterException"]) {
                    if ([errorMessage containsString:@"greater than or equal to 6"]) {
                        errorMessage = @"Password must be at least 6 characters long.";
                        errorTitle = @"Password Strength";
                    } else if ([errorMessage containsString:@"Username should be an email"]) {
                        errorMessage = @"Please enter a valid email address.";
                    }
                }
                if([errorType  isEqual: @"UsernameExistsException"]) {
                    errorTitle = @"Account Exists";
                    errorMessage = @"There is already an account with that email address.";
                }

                if([errorType  isEqual: @"UsernameNotFoundException"]) {
                    errorTitle = @"Email Not Found";
                    errorMessage = @"Sorry, we couldn't find that email address.";
                }
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:errorTitle
                                                                                         message:errorMessage
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }else if(task.result.user.confirmedStatus != AWSCognitoIdentityUserStatusConfirmed){
                self.sentTo = task.result.codeDeliveryDetails.destination;
                [self performSegueWithIdentifier:@"SignUpConfirmSegue" sender:sender];
            }
            else{
                [AWSSignInManager sharedInstance].pendingSignIn = YES;
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setBool:YES forKey:@"hasSignedIn"];
                [defaults synchronize];

                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Registration Complete"
                                                                                         message:@"Your LeakSentinel account has been created."
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    NSLog(@"confirmation dialog %@", self.navigationController.viewControllers);
                [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                }];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }});
        return nil;
    }];
}

@end

@implementation UserPoolSignUpConfirmationViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

// This is used to dismiss the keyboard, user just has to tap outside the
// user name and password views and it will dismiss
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (touch.phase == UITouchPhaseBegan) {
        [self.view endEditing:YES];
    }

    [super touchesBegan:touches withEvent:event];
}

- (void)setUp {
    _userNameRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Email" staticText:self.user.username];
    _confirmationCodeRow = [[AWSFormTableCell alloc] initWithPlaceHolder:@"Confirmation Code" type:InputTypeText];
    _tableDelegate = [AWSFormTableDelegate new];
    [self.tableDelegate addCell:self.userNameRow];
    [self.tableDelegate addCell:self.confirmationCodeRow];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    [self.tableView reloadData];
    [AWSAuthUIHelper setUpFormShadowForView:self.tableFormView];
    [self setUpBackground];

    // setup button background
    [AWSAuthUIHelper applyPrimaryColorFromConfig:self.config
                                          toView:self.confirmButton];
    [AWSAuthUIHelper applyPrimaryColorFromConfig:self.config
                                          toView:self.requestCodeButton
                                      background:NO];
}

- (void)setUpBackground {
    self.view.backgroundColor = [AWSAuthUIHelper getSecondaryBackgroundColor];
    self.title = @"Confirm";
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableFormView.center.y)];
    backgroundImageView.backgroundColor = [AWSAuthUIHelper getBackgroundColor:self.config];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (IBAction)onConfirmCode:(id)sender {
    NSString *confirmationCode = [self.tableDelegate getValueForCell:self.confirmationCodeRow forTableView:self.tableView];
    if ([confirmationCode isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing Code"
                                                                                 message:@"Please enter a valid verification code."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
    [[self.user confirmSignUp:confirmationCode forceAliasCreation:YES] continueWithBlock: ^id _Nullable(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> * _Nonnull task) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
                
                // replace poor AWS error messages with user-friendly versions
                NSErrorUserInfoKey errorType = task.error.userInfo[@"__type"];
                NSErrorUserInfoKey errorTitle = @"Verification Error";
                NSErrorUserInfoKey errorMessage = task.error.userInfo[@"message"];

                if([errorType  isEqual: @"CodeMismatchException"]) {
                    if ([errorMessage containsString:@"Invalid verification code"]) {
                        errorMessage = @"That is not a valid verification code. Please try again.";
                    } else {
                        errorMessage = @"There was a problem verifying your email address. Please try again.";
                    }
                }

                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:errorTitle
                                                                                         message:errorMessage
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];

            } else {
                //return to initial screen
                [AWSSignInManager sharedInstance].pendingSignIn = YES;
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Registration Complete"
                                                                                         message:@"Registration was successful."
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }
        });
        return nil;
    }];
}

- (IBAction)onResendConfirmationCode:(id)sender {
    //resend the confirmation code
    [[self.user resendConfirmationCode] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserResendConfirmationCodeResponse *> * _Nonnull task) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(task.error){
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:task.error.userInfo[@"__type"]
                                                                                         message:task.error.userInfo[@"message"]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }else {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"New Code Sent"
                                                                                         message:[NSString stringWithFormat:@"A new verification code was sent to: %@", task.result.codeDeliveryDetails.destination]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [self presentViewController:alertController
                                   animated:YES
                                 completion:nil];
            }
        });
        return nil;
    }];
}

@end

