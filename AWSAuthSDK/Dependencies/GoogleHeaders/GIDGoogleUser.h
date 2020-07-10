/*
 * GIDGoogleUser.h
 * Google Sign-In iOS SDK
 *
 * Copyright 2014 Google Inc.
 *
 * Use of this SDK is subject to the Google APIs Terms of Service:
 * https://developers.google.com/terms/
 */

#import <Foundation/Foundation.h>

@class GIDAuthentication;
@class GIDProfileData;

/// This class represents a user account.
@interface GIDGoogleUser : NSObject <NSSecureCoding>

/// The Google user ID.
@property(nonatomic, readonly) NSString *userID;

/// Representation of the Basic profile data. It is only available if
/// `GIDSignIn.shouldFetchBasicProfile` is set and either `-[GIDSignIn signIn]` or
/// `-[GIDSignIn restorePreviousSignIn]` has been completed successfully.
@property(nonatomic, readonly) GIDProfileData *profile;

/// The authentication object for the user.
@property(nonatomic, readonly) GIDAuthentication *authentication;

/// The API scopes granted to the app in an array of `NSString`.
@property(nonatomic, readonly) NSArray *grantedScopes;

/// For Google Apps hosted accounts, the domain of the user.
@property(nonatomic, readonly) NSString *hostedDomain;

/// An OAuth2 authorization code for the home server.
@property(nonatomic, readonly) NSString *serverAuthCode;

@end
