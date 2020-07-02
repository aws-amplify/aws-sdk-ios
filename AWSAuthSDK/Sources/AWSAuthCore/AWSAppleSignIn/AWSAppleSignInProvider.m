//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSAppleSignInProvider.h"
#import<AuthenticationServices/AuthenticationServices.h>
#import <AWSAuthCore/AWSSignInManager.h>

typedef void (^AWSSignInManagerCompletionBlock)(id result, NSError *error);

@interface AWSSignInManager()

- (void)completeLogin;

@end

@interface AWSAppleSignInProvider()<ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding>

@property (strong, nonatomic) UIViewController *signInViewController;
@property (atomic, copy) AWSSignInManagerCompletionBlock completionHandler;
@property (nonatomic, copy) NSString *idToken;

@end

@implementation AWSAppleSignInProvider

+ (instancetype)sharedInstance {
    static AWSAppleSignInProvider *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[AWSAppleSignInProvider alloc] init];
    });
    return _sharedInstance;
}

- (void)setViewControllerForAppleSignIn:(UIViewController *)signInViewController {
    self.signInViewController = signInViewController;
}

#pragma mark - AWSIdentityProvider

- (NSString *)identityProviderName {
    return AWSIdentityProviderApple;
}

- (AWSTask<NSString *> *)token {
    AWSTask *task = [AWSTask taskWithResult:_idToken];
    return task;

}

#pragma mark - AWSSignInProvider

- (BOOL)isLoggedIn {
    return _idToken != nil;
}

- (void)login:(AWSSignInManagerCompletionBlock)completionHandler {
    self.completionHandler = completionHandler;
    if (@available(iOS 13, *)) {
        [self appleLogin];
    }
}

- (void)logout {
    // There is no apple api to logout
}

- (void)reloadSession {
    if (@available(iOS 13, *)) {
        [self appleLogin];
    }
}

#pragma mark -

- (void)appleLogin API_AVAILABLE(ios(13)) {
    ASAuthorizationAppleIDProvider *appleIDProvider = [ASAuthorizationAppleIDProvider new];
    ASAuthorizationAppleIDRequest *request = appleIDProvider.createRequest;
    request.requestedScopes = @[ASAuthorizationScopeFullName, ASAuthorizationScopeEmail];
    ASAuthorizationController *controller = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[request]];
    controller.delegate = self;
    controller.presentationContextProvider = self;
    [controller performRequests];
}

- (void)authorizationController:(ASAuthorizationController *)controller
   didCompleteWithAuthorization:(ASAuthorization *)authorization  API_AVAILABLE(ios(13.0)){
    ASAuthorizationAppleIDCredential *credentials = [authorization credential];
    NSData *idTokenData = [credentials identityToken];
    if (idTokenData != nil) {
        self.idToken = [[NSString alloc] initWithData:idTokenData encoding:NSUTF8StringEncoding];
        [[AWSSignInManager sharedInstance] completeLogin];
    } else {

    }
}

- (void)authorizationController:(ASAuthorizationController *)controller
           didCompleteWithError:(NSError *)error  API_AVAILABLE(ios(13.0)){
    if (self.completionHandler) {
        self.completionHandler(nil, error);
    }
}

- (ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller  API_AVAILABLE(ios(13.0)){
    return self.signInViewController.view.window;
}

@end
