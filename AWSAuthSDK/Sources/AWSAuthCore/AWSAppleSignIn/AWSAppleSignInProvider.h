//
//  AWSAppleSignInProvider.h
//  AWSAuthCore
//
//  Created by Roy, Jithin on 6/28/20.
//  Copyright © 2020 Amazon Web Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWSSignInProvider.h"

NS_ASSUME_NONNULL_BEGIN

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

@end

NS_ASSUME_NONNULL_END
