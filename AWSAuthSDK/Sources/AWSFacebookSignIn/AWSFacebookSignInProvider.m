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

#import <AWSAuthCore/AWSSignInManager.h>
#import "AWSFacebookSignInProvider.h"
#import "FBSDKCoreKit.h"
#import "FBSDKLoginKit.h"

static NSTimeInterval const AWSFacebookSignInProviderTokenRefreshBuffer = 10 * 60;

typedef void (^AWSSignInManagerCompletionBlock)(id result, NSError *error);

static NSString* const AWSInfoFacebookSignInIdentifier = @"FacebookSignIn";

@interface AWSSignInManager()

- (void)completeLogin;

@end

@interface AWSFacebookSignInProvider()

@property (strong, nonatomic) id facebookLogin;

@property (strong, nonatomic) NSArray *requestedPermissions;
@property (strong, nonatomic) UIViewController *signInViewController;
@property (atomic, copy) AWSSignInManagerCompletionBlock completionHandler;
@property (strong, nonatomic) AWSTaskCompletionSource *taskCompletionSource;

@end

@implementation AWSFacebookSignInProvider

+ (instancetype)sharedInstance {
    static AWSFacebookSignInProvider *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[AWSFacebookSignInProvider alloc] init];
        if ([_sharedInstance isConfigurationKeyPresent]) {
            [_sharedInstance setPermissions:[_sharedInstance getPermissionsFromConfig]];
        }
    });
    return _sharedInstance;
}

- (instancetype)init {
    
    if (self = [super init]) {
        _requestedPermissions = nil;
        _signInViewController = nil;
        
        return self;
    }
    return nil;
}

- (void) createFBSDKLoginManager {
    self.facebookLogin = [[NSClassFromString(@"FBSDKLoginManager") alloc] init];
}

#pragma mark - Hub user interface

- (void)setPermissions:(NSArray *)requestedPermissions {
    self.requestedPermissions = requestedPermissions;
}

- (void)setViewControllerForFacebookSignIn:(UIViewController *)signInViewController {
    self.signInViewController = signInViewController;
}

#pragma mark - AWSIdentityProvider

- (NSString *)identityProviderName {
    return AWSIdentityProviderFacebook;
}

- (AWSTask<NSString *> *)token {
    Class fbSDKAccessToken = NSClassFromString(@"FBSDKAccessToken");
    NSString *tokenString = [fbSDKAccessToken currentAccessToken].tokenString;
    NSDate *idTokenExpirationDate = [fbSDKAccessToken currentAccessToken].expirationDate;
    
    if (tokenString
        // If the cached token expires within 10 min, tries refreshing a token.
        && [idTokenExpirationDate compare:[NSDate dateWithTimeIntervalSinceNow:AWSFacebookSignInProviderTokenRefreshBuffer]] == NSOrderedDescending) {
        return [AWSTask taskWithResult:tokenString];
    }
    
    self.taskCompletionSource = [AWSTaskCompletionSource taskCompletionSource];
    self.taskCompletionSource.result = [fbSDKAccessToken currentAccessToken].tokenString;
    
    return self.taskCompletionSource.task;
    
}

#pragma mark -

- (BOOL)isLoggedIn {
    Class fbSDKAccessToken = NSClassFromString(@"FBSDKAccessToken");
    if (fbSDKAccessToken) {
        return [fbSDKAccessToken currentAccessToken] != nil;
    }
    return NO;
}

- (void)reloadSession {
    Class fbSDKAccessToken = NSClassFromString(@"FBSDKAccessToken");
    if (fbSDKAccessToken) {
        if([fbSDKAccessToken currentAccessToken]) {
            [fbSDKAccessToken refreshCurrentAccessToken:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                if (error) {
                    AWSDDLogError(@"'refreshCurrentAccessToken' failed: %@", error);
                } else {
                    [self completeLogin];
                }
            }];
        }
    }
}

- (void)completeLogin {
    [[AWSSignInManager sharedInstance] completeLogin];
}

- (void)login:(AWSSignInManagerCompletionBlock) completionHandler {
    
    self.completionHandler = completionHandler;
    Class fbSDKAccessToken = NSClassFromString(@"FBSDKAccessToken");
    if ([fbSDKAccessToken currentAccessToken]) {
        [self completeLogin];
        return;
    }
    
    if (!self.facebookLogin) {
        [self createFBSDKLoginManager];
    }
    
    [self.facebookLogin logInWithPermissions:self.requestedPermissions
                          fromViewController:self.signInViewController
                                     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        
        if (error) {
            self.completionHandler(result, error);
        } else if (result.isCancelled) {
            // Login canceled, allow completionhandler to know about it
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            userInfo[@"message"] = @"User Cancelled Login";
            NSError *resultError = [NSError errorWithDomain:@"com.facebook.sdk.login" code:FBSDKLoginErrorUnknown userInfo:userInfo];
            self.completionHandler(result, resultError);
        } else {
            [self completeLogin];
        }
    }];
}

- (void)logout {
    [[[NSClassFromString(@"FBSDKLoginManager") alloc] init] logOut];
}

- (BOOL)interceptApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    Class fbAppDelegateClass = NSClassFromString(@"FBSDKApplicationDelegate");
    if (fbAppDelegateClass) {
        AWSDDLogDebug(@"Calling didFinishLaunching");
        return [[fbAppDelegateClass sharedInstance] application:application
         didFinishLaunchingWithOptions:launchOptions];
    }
    
    return NO;
}

- (BOOL)interceptApplication:(UIApplication *)application
                     openURL:(NSURL *)url
           sourceApplication:(NSString *)sourceApplication
                  annotation:(id)annotation {
    Class fbAppDelegateClass = NSClassFromString(@"FBSDKApplicationDelegate");
    if (fbAppDelegateClass) {
        if([[fbAppDelegateClass sharedInstance] application:application
                                                 openURL:url
                                       sourceApplication:sourceApplication
                                                 annotation:annotation]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isConfigurationKeyPresent {
    
    AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo].rootInfoDictionary objectForKey:AWSInfoFacebookSignInIdentifier];
    
    if (serviceInfo) {
        AWSDDLogDebug(@"Configuring SignInProvider %@", AWSInfoFacebookSignInIdentifier);
        return true;
    } else {
        return false;
    }
}

- (NSArray<NSString *> *)getPermissionsFromConfig {

    NSDictionary *dict = [[AWSInfo defaultAWSInfo] rootInfoDictionary];
    NSDictionary *providerDict = dict[AWSInfoFacebookSignInIdentifier];
    NSString *permissions = providerDict[@"Permissions"];
    
    if (!permissions) {
        AWSDDLogError(@"Permissions for `%@` is not set correctly in `awsconfiguration.json`.", AWSInfoFacebookSignInIdentifier);
    }
    
    return [permissions componentsSeparatedByString:@","];
}

@end
