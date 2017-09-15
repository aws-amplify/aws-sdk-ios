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

+ (void)presentViewControllerWithNavigationController:(UINavigationController *)navigationController
                                        configuration:(AWSAuthUIConfiguration *)configuration
                                    completionHandler:(AWSAuthUICompletionHandler)completionHandler {
    AWSDDLogDebug(@"Presenting SignInViewController");
    dispatch_async(dispatch_get_main_queue(), ^{
        AWSSignInViewController *loginController = [AWSSignInViewController getAWSSignInViewControllerWithconfiguration:configuration];
        
        loginController.completionHandler = completionHandler;
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginController];
        [navigationController presentViewController:navController
                                           animated:YES
                                         completion:nil];
    });
}

@end
