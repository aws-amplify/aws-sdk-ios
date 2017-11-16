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

@implementation AWSAuthUIViewController

static NSString *const AWSInfoCognitoUserPoolIdentifier = @"CognitoUserPool";
static NSString *const AWSInfoFacebookIdentifier = @"FacebookSignIn";
static NSString *const AWSInfoGoogleIdentifier = @"GoogleSignIn";

#pragma mark PresentViewController methods

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
        [navigationController presentViewController:navController
                                           animated:YES
                                         completion:nil];
    });
}

#pragma mark AuthUIConfiguration methods

+ (AWSAuthUIConfiguration *)getDefaultAuthUIConfiguration {
    
    AWSAuthUIConfiguration *authUIConfig = [[AWSAuthUIConfiguration alloc] init];
    
    if ([AWSAuthUIViewController isConfigurationKeyPresent:AWSInfoCognitoUserPoolIdentifier]) {
        authUIConfig.enableUserPoolsUI = true;
    }
    
    if ([AWSAuthUIViewController isConfigurationKeyPresent:AWSInfoFacebookIdentifier]) {
        [authUIConfig addAWSSignInButtonViewClass:NSClassFromString(@"AWSFacebookSignInButton")];
    }
    
    if ([AWSAuthUIViewController isConfigurationKeyPresent:AWSInfoGoogleIdentifier]) {
        [authUIConfig addAWSSignInButtonViewClass:NSClassFromString(@"AWSGoogleSignInButton")];
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

