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

-(void)pushSignUpVCFromNavigationController:(UINavigationController *)navController {
    AWSUserPoolSignUpViewController *viewController = (AWSUserPoolSignUpViewController *)[self getUserPoolsViewControllerWithIdentifier:USERPOOLS_SIGNUP_VIEW_CONTROLLER_IDENTIFIER];
    viewController.config = self.config;
    [navController pushViewController:viewController
                                         animated:YES];
    
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
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:error.userInfo[@"__type"]
                                                                                     message:error.userInfo[@"message"]
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            [[self.navigationController viewControllers].firstObject presentViewController:alertController
                                                                               animated:YES
                                                                             completion:nil];
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
    NSURL *url = [[currentBundle resourceURL] URLByAppendingPathComponent:RESOURCES_BUNDLE];
    AWSDDLogDebug(@"URL: %@", url);
    
    NSBundle *resourcesBundle = [NSBundle bundleWithURL:url];
    AWSDDLogDebug(@"assetsBundle: %@", resourcesBundle);
    
    [resourcesBundle load];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName
                                                         bundle:resourcesBundle];
    
    if (storyboard) {
        return storyboard;
    } else {
        return [UIStoryboard storyboardWithName:storyboardName
                                         bundle:currentBundle];
    }
}

@end
