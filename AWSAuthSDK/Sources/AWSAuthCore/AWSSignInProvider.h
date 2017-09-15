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

#import <UIKit/UIKit.h>
#import <AWSCore/AWSCore.h>

NS_ASSUME_NONNULL_BEGIN

@class AWSIdentityManager;

typedef NS_ENUM(NSInteger, AWSIdentityManagerAuthState) {
    AWSIdentityManagerAuthStateAuthenticated,
    AWSIdentityManagerAuthStateUnauthenticated,
    AWSIdentityManagerAuthStateUnknown,
};

/**
 * `AWSSignInProvider` protocol defines a list of methods and properties which a Sign-In Provider should implement.
 *
 * The AWSSignInProvider is implemented by difference Sign-In Providers like FacbookSignInProvider, GoogleSignInProvider, etc.
 *
 */
@protocol AWSSignInProvider <AWSIdentityProvider>

/**
 Determines if a user is logged in.
 */
@property (nonatomic, readonly, getter=isLoggedIn) BOOL loggedIn;

/**
 The login handler method for the Sign-In Provider.
 The completionHandler will bubble back errors to the developers.
 */
- (void)login:(void (^)(id _Nullable result, NSError * _Nullable error))completionHandler;

/**
 The logout handler method for the Sign-In Provider.
 */
- (void)logout;

/**
 The handler method for managing the session reload for the Sign-In Provider.
 The completionHandler will bubble back errors to the developers.
 */
- (void)reloadSession;

@end

NS_ASSUME_NONNULL_END
