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

#import "AWSGoogleSignInProvider.h"
#import <AWSAuthCore/AWSSignInManager.h>

#import "GoogleSignIn.h"

static NSString *const AWSGoogleSignInProviderClientScope = @"profile";
static NSString *const AWSGoogleSignInProviderOIDCScope = @"openid";
static NSTimeInterval const AWSGoogleSignInProviderTokenRefreshBuffer = 10 * 60;
static int64_t const AWSGoogleSignInProviderTokenRefreshTimeout = 60 * NSEC_PER_SEC;

typedef void (^AWSSignInManagerCompletionBlock)(id result, NSError *error);

@interface AWSSignInManager()

- (void)completeLogin;

@end

@interface AWSGoogleSignInProvider() <GIDSignInDelegate>

@property (atomic, strong) AWSTaskCompletionSource *taskCompletionSource;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) AWSExecutor *executor;
@property (nonatomic, strong) UIViewController *signInViewController;
@property (atomic, copy) AWSSignInManagerCompletionBlock completionHandler;
@property (nonatomic, strong) GIDSignIn *signInClient;

@end

@implementation AWSGoogleSignInProvider

static NSString *const AWSInfoIdentityManager = @"IdentityManager";
static NSString *const AWSInfoGoogleIdentifierLegacy = @"Google";
static NSString *const AWSInfoGoogleClientIdLegacy = @"ClientId";
static NSString *const AWSInfoGoogleIdentifier = @"GoogleSignIn";
static NSString *const AWSInfoGoogleClientId = @"ClientId-iOS";

+ (instancetype)sharedInstance {
    
    NSString *googleClientID;
    NSDictionary *dict = [[AWSInfo defaultAWSInfo] rootInfoDictionary];
    NSDictionary *googleDict = dict[AWSInfoGoogleIdentifier];
    googleClientID = googleDict[AWSInfoGoogleClientId];
    
    if (!googleClientID) {
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoIdentityManager];
        googleClientID = [[serviceInfo.infoDictionary objectForKey:AWSInfoGoogleIdentifierLegacy] objectForKey:AWSInfoGoogleClientIdLegacy];
    }
    

    if (!googleClientID) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"Google Client ID is not set correctly in `Info.plist` or `awsconfiguration.json`. You need to set it before using `AWSGoogleSignInProvider`."
                                     userInfo:nil];
    }
    
    static AWSGoogleSignInProvider *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[AWSGoogleSignInProvider alloc] initWithGoogleClientID:googleClientID];
        if ([_sharedInstance isConfigurationKeyPresent]) {
            [_sharedInstance setScopes:[_sharedInstance getPermissionsFromConfig]];
        }
    });
    
    return _sharedInstance;
}

- (instancetype)initWithGoogleClientID:(NSString *)googleClientID {
    if (self = [super init]) {
        _semaphore = dispatch_semaphore_create(0);
        
        NSOperationQueue *operationQueue = [NSOperationQueue new];
        _executor = [AWSExecutor executorWithOperationQueue:operationQueue];
        
        _signInViewController = nil;
        
        _signInClient = [NSClassFromString(@"GIDSignIn") sharedInstance];
        self.signInClient.delegate = self;
        self.signInClient.clientID = googleClientID;
        self.signInClient.scopes = @[AWSGoogleSignInProviderClientScope, AWSGoogleSignInProviderOIDCScope];
    }
    
    return self;
}

#pragma mark - Hub user interface

- (void)setScopes:(NSArray *)scopes {
    self.signInClient.scopes = scopes;
}

- (void)setViewControllerForGoogleSignIn:(UIViewController *)signInViewController {
    self.signInViewController = signInViewController;
}

- (UIViewController *)signInViewController {
    if (!_signInViewController) {
        UIViewController *topMostViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (topMostViewController.presentedViewController) {
            topMostViewController = topMostViewController.presentedViewController;
        }
        return topMostViewController;
    }
    return _signInViewController;
}

#pragma mark - AWSIdentityProvider

- (NSString *)identityProviderName {
    return AWSIdentityProviderGoogle;
}

- (AWSTask<NSString *> *)token {
    AWSTask *task = [AWSTask taskWithResult:nil];
    return [task continueWithExecutor:self.executor withBlock:^id _Nullable(AWSTask * _Nonnull task) {
        
        NSString *idToken = self.signInClient.currentUser.authentication.idToken;
        NSDate *idTokenExpirationDate = self.signInClient.currentUser.authentication.idTokenExpirationDate;
        
        if (idToken
            // If the cached token expires within 10 min, tries refreshing a token.
            && [idTokenExpirationDate compare:[NSDate dateWithTimeIntervalSinceNow:AWSGoogleSignInProviderTokenRefreshBuffer]] == NSOrderedDescending) {
            return [AWSTask taskWithResult:idToken];
        }
        
        if (self.taskCompletionSource) {
            // Waits up to 60 seconds for the Google SDK to refresh a token.
            if (dispatch_semaphore_wait(self.semaphore, dispatch_time(DISPATCH_TIME_NOW, AWSGoogleSignInProviderTokenRefreshTimeout)) != 0) {
                NSError *error = [NSError errorWithDomain:AWSCognitoCredentialsProviderHelperErrorDomain
                                                     code:AWSCognitoCredentialsProviderHelperErrorTypeTokenRefreshTimeout
                                                 userInfo:nil];
                return [AWSTask taskWithError:error];
            }
        }
        
        idToken = self.signInClient.currentUser.authentication.idToken;
        idTokenExpirationDate = self.signInClient.currentUser.authentication.idTokenExpirationDate;
        
        if (idToken
            // If the cached token expires within 10 min, tries refreshing a token.
            && [idTokenExpirationDate compare:[NSDate dateWithTimeIntervalSinceNow:AWSGoogleSignInProviderTokenRefreshBuffer]] == NSOrderedDescending) {
            return [AWSTask taskWithResult:idToken];
        }
        
        // `self.taskCompletionSource` is used to convert the `GIDSignInDelegate` method to a block based method.
        // The `token` string or an error object is returned in a block when the delegate method is called later.
        // See the `GIDSignInDelegate` section of this file.
        self.taskCompletionSource = [AWSTaskCompletionSource taskCompletionSource];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self signInSilently];
        });
        return self.taskCompletionSource.task;
    }];
}

- (void)signInSilently {
    [self.signInClient restorePreviousSignIn];
}

#pragma mark - AWSSignInProvider

- (BOOL)isLoggedIn {
    return [self.signInClient hasPreviousSignIn];
}

- (void)reloadSession {
    if ([self isLoggedIn]) {
        [self signInSilently];
    }
}

- (void)login:(AWSSignInManagerCompletionBlock)completionHandler {
    self.completionHandler = completionHandler;
    self.signInClient.presentingViewController = self.signInViewController;
    [self.signInClient signIn];
}

- (void)logout {
    [self.signInClient disconnect];
}

#pragma mark - GIDSignInDelegate

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // `self.taskCompletionSource` is used to return `user.authentication.idToken` or `error` to the `- token` method.
    // See the `AWSIdentityProvider` section of this file.
    if (error) {
        AWSDDLogError(@"Error: %@", error);
        if (self.taskCompletionSource) {
            self.taskCompletionSource.error = error;
            self.taskCompletionSource = nil;
        }
        if (self.completionHandler) {
            self.completionHandler(nil, error);
        }
    } else {
        if (self.taskCompletionSource) {
            self.taskCompletionSource.result = user.authentication.idToken;
            self.taskCompletionSource = nil;
        }
        [self completeLoginWithToken];
    }
    dispatch_semaphore_signal(self.semaphore);
}

- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error {
    if (error) {
        AWSDDLogError(@"Error: %@", error);
    }
}

- (void)completeLoginWithToken {
    [[AWSSignInManager sharedInstance] completeLogin];
}

#pragma mark - GIDSignInUIDelegate (Removed)

/// These methods should never be called since GIDSignInUIDelegate no longer exists.
/// However, we'll retain them in case there is some code path we're not aware of that
/// invokes it.

- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
    AWSDDLogError(@"Error: Invoked removed GIDSignInUIDelegate method: %s", __func__);
    if (error) {
        AWSDDLogError(@"Error: %@", error);
    }
}

- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController {
    AWSDDLogError(@"Error: Invoked removed GIDSignInUIDelegate method: %s", __func__);
}

- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController {
    AWSDDLogError(@"Error: Invoked removed GIDSignInUIDelegate method: %s", __func__);
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Application delegates

- (BOOL)interceptApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (BOOL)interceptApplication:(UIApplication *)application
                     openURL:(NSURL *)url
           sourceApplication:(NSString *)sourceApplication
                  annotation:(id)annotation {
    return [self.signInClient handleURL:url];
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
    return [self.signInClient handleURL:url];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [self.signInClient handleURL:url];
}

#pragma mark - Utilities

- (BOOL)isConfigurationKeyPresent {
    
    NSString *googleclientId;
    NSDictionary *dict = [[AWSInfo defaultAWSInfo] rootInfoDictionary];
    NSDictionary *providerDict = dict[AWSInfoGoogleIdentifier];
    googleclientId = providerDict[AWSInfoGoogleClientId];
    
    if (googleclientId) {
        AWSDDLogDebug(@"Configuring SignInProvider : %@.", AWSInfoGoogleIdentifier);
        return true;
    } else {
        return false;
    }
}

- (NSArray<NSString *> *)getPermissionsFromConfig {
    
    NSDictionary *dict = [[AWSInfo defaultAWSInfo] rootInfoDictionary];
    NSDictionary *providerDict = dict[AWSInfoGoogleIdentifier];
    NSString *permissions = providerDict[@"Permissions"];
    
    if (!permissions) {
        AWSDDLogError(@"Permissions for `%@` is not set correctly in `awsconfiguration.json`.", AWSInfoGoogleIdentifier);
    }
    
    return [permissions componentsSeparatedByString:@","];
}

@end
