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

#import "AWSAuthUIViewController.h"
#import "AWSSignInViewController.h"

@interface AWSSignInManager()
@property (nonatomic) BOOL shouldFederate;
-(void)setDontFederate;
@end

@interface AWSSignInViewController()
-(void)createInternalCompletionHandler;
@end

@interface AWSAuthUIViewController()

typedef void(^AWSAuthUIExtendedCompletionHandler)(NSString * _Nullable signInProviderKey, NSString * _Nullable signInProviderToken, NSError * _Nullable error);

@end

@implementation AWSAuthUIViewController

static NSString *const AWSInfoCognitoUserPoolIdentifier = @"CognitoUserPool";
static NSString *const AWSInfoFacebookIdentifier = @"FacebookSignIn";
static NSString *const AWSInfoGoogleIdentifier = @"GoogleSignIn";

#pragma mark PresentViewController methods

// new signIn screen which allows optional federation
+ (void)presentViewControllerWithConfig:(NSMutableDictionary<NSString *, id> *)configDictionary
                      completionHandler:(AWSAuthUIExtendedCompletionHandler)completionHandler {
    
    UINavigationController *navigationController = (UINavigationController *)configDictionary[@"navigationController"];
    AWSAuthUIConfiguration *config = [AWSAuthUIViewController getDefaultAuthUIConfiguration];
    if(configDictionary[@"canCancel"]) {
        NSString *canCancelValue = (NSString *)configDictionary[@"canCancel"];
        [config setCanCancel:[canCancelValue isEqual: @"YES"]];
    }
    if (configDictionary[@"logoImage"]) {
        [config setLogoImage:(UIImage *)configDictionary[@"logoImage"]];
    }
    if (configDictionary[@"backgroundColor"]) {
        [config setBackgroundColor:(UIColor *)configDictionary[@"backgroundColor"]];
    }
                        
    if(configDictionary[@"disableSignUpButton"]) {
        NSString *disableSignUpButtonValue = (NSString *)configDictionary[@"disableSignUpButton"];
        if ([disableSignUpButtonValue isEqual: @"YES"]) {
            [config setDisableSignUpButton:true];
        } else {
            [config setDisableSignUpButton:false];
        }
    }
                        
    if (configDictionary[@"secondaryBackgroundColor"]) {
        [config setSecondaryBackgroundColor:(UIColor *)configDictionary[@"secondaryBackgroundColor"]];
    }
    if (configDictionary[@"primaryColor"]) {
        [config setPrimaryColor:(UIColor *)configDictionary[@"primaryColor"]];
    }
    
    [[AWSSignInManager sharedInstance] setDontFederate];
    
    AWSDDLogDebug(@"Presenting SignInViewController");
    dispatch_async(dispatch_get_main_queue(), ^{
        
        AWSSignInViewController *loginController;
        loginController = [AWSSignInViewController getAWSSignInViewControllerWithconfiguration: config];
        
        loginController.completionHandlerCustom = completionHandler;
        [loginController createInternalCompletionHandler];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginController];

        navController.modalPresentationStyle = UIModalPresentationFullScreen;

        [navigationController presentViewController:navController
                                           animated:YES
                                         completion:nil];
    });
}

// legacy method for existing customers
+ (void)presentViewControllerWithNavigationController:(UINavigationController *)navigationController
                                        configuration:(AWSAuthUIConfiguration *)authUIConfiguration
                                    completionHandler:(AWSAuthUICompletionHandler)completionHandler {
    
    AWSDDLogDebug(@"Presenting SignInViewController");
    dispatch_async(dispatch_get_main_queue(), ^{
        AWSSignInViewController *loginController;
        if (authUIConfiguration == nil) {
            loginController = [AWSSignInViewController getAWSSignInViewControllerWithconfiguration:[AWSAuthUIViewController getDefaultAuthUIConfiguration]];
        } else {
            loginController = [AWSSignInViewController getAWSSignInViewControllerWithconfiguration:authUIConfiguration];
        }
        
        loginController.completionHandler = completionHandler;
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginController];

        navController.modalPresentationStyle = UIModalPresentationFullScreen;

        [navigationController presentViewController:navController
                                           animated:YES
                                         completion:nil];
    });
}

#pragma mark AuthUIConfiguration methods

+ (AWSAuthUIConfiguration *)getDefaultAuthUIConfiguration {
    
    AWSAuthUIConfiguration *authUIConfig = [[AWSAuthUIConfiguration alloc] init];
    
    if ([AWSAuthUIViewController isConfigurationKeyPresent:AWSInfoCognitoUserPoolIdentifier]) {
        Class userpoolClass = NSClassFromString(@"AWSCognitoUserPoolsSignInProvider");
        if (userpoolClass) {
            authUIConfig.enableUserPoolsUI = true;
        } else {
            AWSDDLogWarn(@"Found UserPool configuration in awsconfiguration.json but could not find dependencies. Skipping rendering in AuthUI");
        }
    }
    
    if ([AWSAuthUIViewController isConfigurationKeyPresent:AWSInfoFacebookIdentifier]) {
        Class fbClass = NSClassFromString(@"AWSFacebookSignInButton");
        if (fbClass) {
            [authUIConfig addAWSSignInButtonViewClass:fbClass];
        } else {
            AWSDDLogWarn(@"Found Facebook sign in configuration in awsconfiguration.json but could not find dependencies. Skipping rendering in AuthUI");
        }
    }
    
    if ([AWSAuthUIViewController isConfigurationKeyPresent:AWSInfoGoogleIdentifier]) {
        Class googleClass = NSClassFromString(@"AWSGoogleSignInButton");
        if (googleClass) {
            [authUIConfig addAWSSignInButtonViewClass:googleClass];
        } else {
            AWSDDLogWarn(@"Found Google sign in configuration in awsconfiguration.json but could not find dependencies. Skipping rendering in AuthUI");
        }
    }
    
    authUIConfig.canCancel = false;
    
    return authUIConfig;
}

+ (BOOL)isConfigurationKeyPresent:(NSString *)configurationKey {
    
    AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo].rootInfoDictionary objectForKey:configurationKey];
    
    NSString *googleclientId;
    if (configurationKey == AWSInfoGoogleIdentifier) {
        NSDictionary *dict = [[AWSInfo defaultAWSInfo] rootInfoDictionary];
        NSDictionary *providerDict = dict[configurationKey];
        googleclientId = providerDict[@"ClientId-iOS"];
        if (!googleclientId) {
            return false;
        }
    }
    
    if (serviceInfo) {
        AWSDDLogDebug(@"Configuring SignInProvider : %@.", configurationKey);
        return true;
    } else {
        return false;
    }
}

@end

