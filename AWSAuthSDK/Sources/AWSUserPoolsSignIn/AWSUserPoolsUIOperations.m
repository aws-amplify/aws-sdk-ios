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


#import "AWSUserPoolsUIOperations.h"
#import "AWSUserPoolSignUpViewController.h"
#import "AWSUserPoolForgotPasswordViewController.h"
#import "AWSUserPoolMFAViewController.h"
#import "AWSuserPoolNewPasswordRequiredViewController.h"
#import <AWSAuthCore/AWSUIConfiguration.h>
#import <AWSAuthCore/AWSSignInManager.h>


static NSString *const USERPOOLS_STORYBOARD = @"AWSUserPools";
static NSString *const USERPOOLS_MFA_VIEW_CONTROLLER_IDENTIFIER = @"MFA";
static NSString *const USERPOOLS_SIGNUP_VIEW_CONTROLLER_IDENTIFIER = @"SignUp";
static NSString *const USERPOOLS_FORGOT_PASSWORD_VIEW_CONTROLLER_IDENTIFIER = @"ForgotPassword";
static NSString *const RESOURCES_BUNDLE = @"AWSUserPoolsSignIn.bundle";

@interface AWSUserPoolsUIOperations()<AWSCognitoIdentityInteractiveAuthenticationDelegate, AWSCognitoIdentityPasswordAuthentication, AWSCognitoUserPoolsSignInHandler>

@property (strong, nonatomic) id<AWSUIConfiguration> config;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (nonatomic, copy) void (^completionHandler)(id<AWSSignInProvider> signInProvider, NSError * _Nullable error);
@property (nonatomic, strong) AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails*>* passwordAuthenticationCompletion;
@property (nonatomic, strong) AWSUserPoolMFAViewController* mfaViewController;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@end

@implementation AWSUserPoolsUIOperations

-(void)loginWithUserName:(NSString *)userName
                password:(NSString *)password
    navigationController:(UINavigationController *)navController
       completionHandler:(nonnull void (^)(id _Nullable, NSError * _Nullable))completionHandler {
    self.userName = userName;
    self.password = password;
    self.completionHandler = completionHandler;
    self.navigationController = navController;
    [[AWSCognitoUserPoolsSignInProvider sharedInstance] setInteractiveAuthDelegate:self];
    [self handleLoginWithSignInProvider:[AWSCognitoUserPoolsSignInProvider sharedInstance]];
}

-(id)initWithAuthUIConfiguration:(id<AWSUIConfiguration>)configuration {
    if (self = [super init]) {
        self.config = configuration;
    }
    return self;
}

-(id)init {
    [NSException raise:NSInternalInconsistencyException format:@"Please use `initWithAuthUIConfiguration:` instead of the init"];
    return nil;
}

-(void)pushSignUpVCFromNavigationControllerThenSendCode:navController userName:userName {
    AWSUserPoolSignUpViewController *signUpViewController = (AWSUserPoolSignUpViewController *)[self getUserPoolsViewControllerWithIdentifier:USERPOOLS_SIGNUP_VIEW_CONTROLLER_IDENTIFIER];
    signUpViewController.config = self.config;
    signUpViewController.resendCode = true;
    signUpViewController.userName = userName;
    [navController pushViewController:signUpViewController
                             animated:YES];
}

-(void)slideSignUpVCFromNavigationController:(UINavigationController *)navController {
    AWSUserPoolSignUpViewController *viewController = (AWSUserPoolSignUpViewController *)[self getUserPoolsViewControllerWithIdentifier:USERPOOLS_SIGNUP_VIEW_CONTROLLER_IDENTIFIER];
    viewController.config = self.config;
    
    [navController initWithRootViewController:viewController];
    
    // remove sign-in view controller from stack
    //    NSLog(@"%@", navController.viewControllers);
    //    [navController setViewControllers:@[navController.topViewController]];
}



-(void)pushForgotPasswordVCFromNavigationController:(UINavigationController *)navController {
    AWSUserPoolForgotPasswordViewController *viewController =
    (AWSUserPoolForgotPasswordViewController *)[self getUserPoolsViewControllerWithIdentifier:USERPOOLS_FORGOT_PASSWORD_VIEW_CONTROLLER_IDENTIFIER];
    viewController.config = self.config;
    [navController pushViewController:viewController
                             animated:YES];
}

- (UIViewController *)getUserPoolsViewControllerWithIdentifier:(NSString *)viewControllerIdentifier {
    return [AWSUserPoolsUIOperations getViewControllerWithName:viewControllerIdentifier
                                                    storyboard:USERPOOLS_STORYBOARD];
}

- (void)handleUserPoolSignInFlowStart {
    self.passwordAuthenticationCompletion.result = [[AWSCognitoIdentityPasswordAuthenticationDetails alloc]
                                                    initWithUsername:self.userName
                                                    password:self.password];
}

- (void)handleLoginWithSignInProvider:(id<AWSSignInProvider>)signInProvider {
    [[AWSSignInManager sharedInstance]
     loginWithSignInProviderKey:[signInProvider identityProviderName]
     completionHandler:^(id result, NSError *error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self.navigationController viewControllers].firstObject  dismissViewControllerAnimated:YES
                                                                                             completion:nil];
                if (self.completionHandler) {
                    self.completionHandler(signInProvider, error);
                }
            });
        } else {
            // in case of error, propogate the error back to customer, but do not dismiss sign in vc
            if (self.completionHandler) {
                self.completionHandler(signInProvider, error);
            }
        }
        
        AWSDDLogDebug(@"result = %@, error = %@", result, error);
    }];
}

-(id<AWSCognitoIdentityNewPasswordRequired>) startNewPasswordRequired {
    
    AWSUserPoolNewPasswordRequiredViewController *viewController = (AWSUserPoolNewPasswordRequiredViewController *)[self getUserPoolsViewControllerWithIdentifier:@"NewPasswordRequired"];
    viewController.config = self.config;
    dispatch_sync(dispatch_get_main_queue(), ^{
        if ([self.navigationController.topViewController isKindOfClass:[AWSUserPoolNewPasswordRequiredViewController class]]) {
            [self.navigationController pushViewController:viewController animated:NO];
        } else{
            [self.navigationController pushViewController:viewController animated:YES];
        }
    });
    
    return viewController;
}

-(id<AWSCognitoIdentityPasswordAuthentication>) startPasswordAuthentication {
    return self;
}

-(id<AWSCognitoIdentityMultiFactorAuthentication>) startMultiFactorAuthentication {
    AWSUserPoolMFAViewController *viewController = (AWSUserPoolMFAViewController *)[self getUserPoolsViewControllerWithIdentifier:USERPOOLS_MFA_VIEW_CONTROLLER_IDENTIFIER];
    viewController.config = self.config;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:viewController
                                             animated:YES];
    });
    
    return viewController;
}

-(void) getPasswordAuthenticationDetails: (AWSCognitoIdentityPasswordAuthenticationInput *) authenticationInput  passwordAuthenticationCompletionSource: (AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails *> *) passwordAuthenticationCompletionSource {
    self.passwordAuthenticationCompletion = passwordAuthenticationCompletionSource;
}

-(void) didCompletePasswordAuthenticationStepWithError:(NSError*) error {
    if(error){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *originalTitle = error.userInfo[@"__type"];
            NSString *originalMessage = error.userInfo[@"message"];
            NSString *friendlyTitle = [AWSUserPoolsUIOperations getUserFriendlyTitle:originalTitle
                                                 originalMessage:originalMessage];
            
            NSString *friendlyMessage = [AWSUserPoolsUIOperations getUserFriendlyMessage:originalTitle
                                                     originalMessage:originalMessage];
            
            // oddball case: user never confirmed account creation, so offer to send another confirmation code
            if([originalTitle  isEqual: @"UserNotConfirmedException"]) {

                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:friendlyTitle
                                                                                         message:friendlyMessage
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sendCode = [UIAlertAction actionWithTitle:@"Send Code" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    UIViewController *vc = [self.navigationController viewControllers].firstObject;
                    UINavigationController *nav = vc.navigationController;
                    [self pushSignUpVCFromNavigationControllerThenSendCode:nav userName:self.userName];

                }];
                [alertController addAction:sendCode];

                UIAlertAction *noThanks = [UIAlertAction actionWithTitle:@"No Thanks" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:noThanks];

                [[self.navigationController viewControllers].firstObject presentViewController:alertController
                                                                                      animated:YES
                                                                                    completion:nil];
   
            }
            else
            {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:friendlyTitle
                                                                                         message:friendlyMessage
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                [[self.navigationController viewControllers].firstObject presentViewController:alertController
                                                                                      animated:YES
                                                                                    completion:nil];
            }
        });
    }
}

+ (UIViewController *)getViewControllerWithName:(NSString *)viewControllerIdentitifer
                                     storyboard:(NSString *)storyboardIdentifier {
    UIStoryboard *storyboard = [AWSUserPoolsUIOperations getUIStoryboardFromBundle:storyboardIdentifier];
    return (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerIdentitifer];
}

+ (UIStoryboard *)getUIStoryboardFromBundle:(NSString *)storyboardName {
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    
    // Check if the storyboard is available in the framework directly; if available fetch and return it.
    // This is applicable when dependency is consumed via Carthage/ Frameworks.
    if ([currentBundle pathForResource:storyboardName ofType:@"storyboardc"] != nil) {
        return [UIStoryboard storyboardWithName:storyboardName
                                         bundle:currentBundle];
    }
    
    // If the storyboard is not available in the framework, it is part of the resources bundle.
    // This is applicable when dependency is consumed via Cocoapods.
    NSURL *url = [[currentBundle resourceURL] URLByAppendingPathComponent:RESOURCES_BUNDLE];
    AWSDDLogDebug(@"URL: %@", url);
    
    NSBundle *resourcesBundle = [NSBundle bundleWithURL:url];
    AWSDDLogDebug(@"assetsBundle: %@", resourcesBundle);
    
    return [UIStoryboard storyboardWithName:storyboardName
                                     bundle:resourcesBundle];
}

static NSDictionary *userFriendlyTitleDictionary = nil;
static NSDictionary *userFriendlyMessageDictionary = nil;

+ (NSString *)getUserFriendlyTitle:(NSString *)originalTitle
                  originalMessage:(NSString *)originalMessage {
    
    if (userFriendlyTitleDictionary == nil) {
        [self initializeErrorCodeDictionaries];
    }
    NSString *friendlyTitle = originalTitle;
    
    // see if title key is in our dictionary
    if ([userFriendlyTitleDictionary objectForKey:originalTitle]) {
        // yes, get it
        NSString *value = userFriendlyTitleDictionary[originalTitle];
        
        // if key is parameter error, need to look at message, too
        if([originalTitle  isEqual: @"InvalidParameterException"]) {
             if ([originalMessage containsString:@"greater than or equal to 6"]) {
                 value = @"Invalid Password";
             } else if ([originalMessage containsString:@"Username should be an email"]) {
                 value = @"Account Error";
             } else if ([originalMessage containsString:@"Cannot reset password for the user as there is no registered"]) {
                value = @"Account Error";
             }
        }
        friendlyTitle = value;
    }
    return friendlyTitle;
}

+ (NSString *)getUserFriendlyMessage:(NSString *)originalTitle
                    originalMessage:(NSString *)originalMessage {
    
    if (userFriendlyMessageDictionary == nil) {
        [self initializeErrorCodeDictionaries];
    }
    
    NSString *friendlyMessage = originalMessage;

    // see if title key is in our dictionary
    if ([userFriendlyTitleDictionary objectForKey:originalTitle]) {
        // yes, get it
        NSString *value = userFriendlyMessageDictionary[originalTitle];
        
        // if key is parameter error, need to look at message, too
        if([originalTitle  isEqual: @"InvalidParameterException"]) {
            if ([originalMessage containsString:@"greater than or equal to 6"]) {
                value = @"Invalid Password";
            } else if ([originalMessage containsString:@"Username should be an email"]) {
                value = @"User name should be an email address.";
            } else if ([originalMessage containsString:@"Cannot reset password for the user as there is no registered"]) {
               value = @"Cannot reset the password for this account because there is no verified email address associated with this account.";
            } else {
                value = @"Sorry, there was an error accessing your account. Please try again.";
            }
        }
        friendlyMessage = value;
    }
    return friendlyMessage;
}

+ (void)initializeErrorCodeDictionaries {
    userFriendlyTitleDictionary =  @{
        @"UserNotFoundException" : @"Email Not Found",
        @"InvalidParameterException" : @"No Email Address",
        @"NotAuthorizedException" : @"Account Not Found",
        @"CodeMismatchException" : @"Invalid Code",
        @"LimitExceededException" : @"Too Many Attempts",
        @"InvalidPasswordException" : @"Invalid Password",
        @"UsernameExistsException" : @"Account Exists",
        @"UserNotConfirmedException" : @"Account Error"
    };
    userFriendlyMessageDictionary = @{
        @"UserNotFoundException" : @"Sorry, we did not find an account with that email address.",
        @"InvalidParameterException" : @"Please enter an email address.",
        @"NotAuthorizedException" : @"Sorry, we did not find an acccount with that email address and password combination.",
        @"CodeMismatchException" : @"Sorry, that code is not correct. Please try again.",
        @"LimitExceededException" : @"Sorry, you have exceeded the number of retries. Please wait for a while before trying again.",
        @"InvalidPasswordException" : @"Your password must be at least six characters long.",
        @"UsernameExistsException" : @"An account with that email address already exists.",
        @"UserNotConfirmedException" : @"Sorry, that account’s email address was never confirmed.\n\nIf you like, we can send another confirmation code to that email address."
    };
}

@end

