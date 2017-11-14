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
#import "AWSSignInProvider.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * This protocol defines the method to be implemented to receive a call back when a user attempts
 * login with a registered sign-in provider.
 */
@protocol AWSSignInDelegate <NSObject>

/**
 This method gets a call back to the assigned delegate when a user attempts login with a registered sign-in provider.
 
 @param  signInProvider    The instance of sign in provider implementing `AWSSignInProvider` protocol.
 @param  result            The result of login attempt. If error, set to `nil`.
 @param  error             The error if sign-in attempt failed.
 **/
- (void)onLoginWithSignInProvider:(id<AWSSignInProvider>)signInProvider
                           result:(id _Nullable)result
                            error:(NSError * _Nullable)error NS_SWIFT_NAME(onLogin(signInProvider:result:error:));

@end

@interface AWSSignInManager : NSObject

/**
 * Indicates whether the user is signed-in or not.
 * @return true if user is signed-in
 */
@property (nonatomic, readonly, getter=isLoggedIn) BOOL loggedIn;

/**
 * The delegate class to be called when a user attempts to login with a registered sign in provider.
 */
@property (nonatomic, weak) id<AWSSignInDelegate> delegate;

/*
 * Fetches the shared instance of `AWSSignInManager`.
 */
+(instancetype)sharedInstance;

/**
 Registers the shared instance of sign in provider implementing `AWSSignInProvider`.
 
 @param  signInProvider    The shared instance of sign in provider implementing `AWSSignInProvider` protocol.
 **/
-(void)registerAWSSignInProvider:(id<AWSSignInProvider>)signInProvider NS_SWIFT_NAME(register(signInProvider:));

/**
 * Signs the user out of whatever third party identity provider they used to sign in.
 * @param completionHandler used to callback application with async operation results
 */
- (void)logoutWithCompletionHandler:(void (^)(id _Nullable result, NSError * _Nullable error))completionHandler;

/**
 * Signs the user in with an identity provider. Note that even if User Sign-in is not
 * enabled in the project, the user is still signed-in with the Guest type provider.
 * @param signInProviderKey the identifier key of sign in provider
 * @param completionHandler used to callback application with async operation results
 */
- (void)loginWithSignInProviderKey:(NSString *)signInProviderKey
                 completionHandler:(void (^)(id _Nullable result, NSError * _Nullable error))completionHandler NS_SWIFT_NAME(login(signInProviderKey:completionHandler:));

/**
 * Attempts to resume session with the previous sign-in provider.
 * @param completionHandler used to callback application with async operation results
 */
- (void)resumeSessionWithCompletionHandler:(void (^)(id _Nullable result, NSError * _Nullable error))completionHandler;

/**
 * Passes parameters used to launch the application to the current identity provider. For some
 * third party providers, this completes the User Sign-in call flow, which used a browser to
 * get information from the user, directly. The current sign-in provider will be set to nil if
 * the sign-in provider is not registered using `registerAWSSignInProvider:forKey` method  of
 * `AWSSignInProviderFactory` class.
 *
 * @param application application
 * @param launchOptions options used to launch the application
 * @return true if this call handled the operation
 */
- (BOOL)interceptApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions;

/**
 * Passes parameters used to launch the application to the current identity provider. For some
 * third party providers, this completes the User Sign-in call flow, which used a browser to
 * get information from the user, directly.
 *
 * @param application application
 * @param url url used to open the application
 * @param sourceApplication source application
 * @param annotation annotation
 * @return true if this call handled the operation
 */
- (BOOL)interceptApplication:(UIApplication *)application
                     openURL:(NSURL *)url
           sourceApplication:(nullable NSString *)sourceApplication
                  annotation:(id)annotation;

@end

NS_ASSUME_NONNULL_END
