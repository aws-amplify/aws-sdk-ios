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
#import <UIKit/UIKit.h>
#import <AuthenticationServices/AuthenticationServices.h>

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSCognitoAuth
FOUNDATION_EXPORT NSString *const AWSCognitoAuthSDKVersion;

@class AWSCognitoAuthUserSession;
@class AWSCognitoAuthUserSessionToken;
@class AWSCognitoAuthConfiguration;

@protocol AWSCognitoAuthDelegate;

/**
 The error domain for AWSCognitoAuth errors.
 <ul>
 <li>AWSCognitoAuthClientErrorUnknown - Unknown error.</li>
 <li>AWSCognitoAuthClientErrorUserCanceledOperation - User canceled flow.</li>
 <li>AWSCognitoAuthClientErrorLoadingPageFailed - A necessary page failed to load.</li>
 <li>AWSCognitoAuthClientErrorBadRequest - A parameter was missing or invalid.</li>
 <li>AWSCognitoAuthClientErrorSecurityReason - The security of this request could not be guaranteed.</li>
 <li>AWSCognitoAuthClientInvalidAuthenticationDelegate - The AWSCognitoAuthDelegate delegate is not setup or returned an invalid value.</li>
 <li>AWSCognitoAuthClientNoIdTokenIssued - If no id token was issued. For future use. </li>
 <li>AWSCognitoAuthClientErrorExpiredRefreshToken - If the refresh token is expired. </li>
 </ul>
 */
FOUNDATION_EXPORT NSString *const AWSCognitoAuthErrorDomain;

typedef NS_ENUM(NSInteger, AWSCognitoAuthClientErrorType) {
    AWSCognitoAuthClientErrorUnknown = 0,
    AWSCognitoAuthClientErrorUserCanceledOperation = -1000,
    AWSCognitoAuthClientErrorLoadingPageFailed = -2000,
    AWSCognitoAuthClientErrorBadRequest = -3000,
    AWSCognitoAuthClientErrorSecurityFailed = -4000,
    AWSCognitoAuthClientInvalidAuthenticationDelegate = -5000,
    AWSCognitoAuthClientNoIdTokenIssued = -6000,
    AWSCognitoAuthClientErrorExpiredRefreshToken = -7000
};

typedef void (^AWSCognitoAuthGetSessionBlock)(AWSCognitoAuthUserSession * _Nullable session, NSError * _Nullable error);
typedef void (^AWSCognitoAuthSignOutBlock)(NSError * _Nullable error);


/**
 A lightweight web-based ui to manage signup/signin of your end users
 */
@interface AWSCognitoAuth : NSObject

/**
 Set this delegate to obtain the current view controller to interact with the end user
 */
@property (nonatomic, weak) id <AWSCognitoAuthDelegate> delegate;

/**
 The auth configuration
 */
@property (nonatomic, readonly) AWSCognitoAuthConfiguration *authConfiguration;

/**
 Determines whether there is an active session or not. If the refresh token is expired
 the end user will be prompted to authenticate when you call getSession.
 */
@property (nonatomic, readonly, getter=isSignedIn) BOOL signedIn;

/**
 Fetches the Cognito User Pool instance configured in the `info.plist` under `AWS->CognitoUserPool->Default`
 @return the default instance for Cognito Auth 
 */
+ (instancetype)defaultCognitoAuth;

/**
 Register a managed instance with name forKey and configuration authConfiguration.
 @param authConfiguration the auth configuration
 @param key the key to register under
 */
+ (void)registerCognitoAuthWithAuthConfiguration:(AWSCognitoAuthConfiguration *)authConfiguration
                                          forKey:(NSString *)key;
/**
 Fetch a managed instance with a particular AuthConfiguration.
 @param key the key to fetch
 @return the CognitoAuth object
 */
+ (instancetype)CognitoAuthForKey:(NSString *)key;

/**
 Unregister a managed instance.
 @param key key to remove the object for
 */
+ (void)removeCognitoAuthForKey:(NSString *)key;

/**
 Launches the signin UI and updates the session after the user logs in.
 @param vc Presentation view controller to display the hosted UI signIn
 @param completion completion block to invoke on completion
 */
- (void)launchSignInWithViewController:(UIViewController *) vc
                            completion:(nullable AWSCognitoAuthGetSessionBlock) completion;

/**
 Launches the signin UI and updates the session after the user logs in.
 @param anchor Presentation anchor to display the hosted UI signIn
 @param completion completion block to invoke on completion
 */
- (void)launchSignInWithWebUI:(nonnull ASPresentationAnchor) anchor
                   completion:(nullable AWSCognitoAuthGetSessionBlock) completion API_AVAILABLE(ios(13));

/**
 Get a session with id, access and refresh tokens.
 @param anchor Presentation anchor to display the hosted UI on if needed during sign in.
 @param completion completion block to invoke on completion
 */
- (void)getSessionWithWebUI:(nonnull ASPresentationAnchor) anchor
                 completion:(nullable AWSCognitoAuthGetSessionBlock) completion API_AVAILABLE(ios(13));

/**
 Get a session with id, access and refresh tokens.
 @param vc viewController to display the UI on if needed during sign in.
 @param completion completion block to invoke on completion
 */
- (void)getSession:(UIViewController *) vc completion: (nullable AWSCognitoAuthGetSessionBlock) completion;

/**
 Get a session with id, access and refresh tokens, use delegate to get view controller.
 @param completion completion block to invoke on completion
 */
- (void)getSession: (nullable AWSCognitoAuthGetSessionBlock) completion;

- (void) signOutWithWebUI:(nonnull ASPresentationAnchor) anchor
               completion:(AWSCognitoAuthSignOutBlock)completion API_AVAILABLE(ios(13));

/**
 Sign out locally and from the server.
 @param vc viewController to display the UI on during sign out.
 @param completion completion block to invoke on completion
 */
- (void) signOut:(UIViewController *) vc completion: (nullable AWSCognitoAuthSignOutBlock) completion;

/**
 Sign out locally and from the server, use delegate to get view controller.
 @param completion completion block to invoke on completion
 */
- (void) signOut: (nullable AWSCognitoAuthSignOutBlock) completion;

/**
 Remove user session from keychain
 */
-(void) signOutLocally;

/**
 Remove user session from keychain and clear last known username.
 */
-(void) signOutLocallyAndClearLastKnownUser;


/**
 Method to handle app redirect.  Call from AppDelegate application:openURL:options
 */
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;


@end

/**
 Houses all configuration for AWSCognitoAuth
 */
@interface AWSCognitoAuthConfiguration : NSObject

/**
 The app client id
 */
@property (nonatomic, readonly) NSString * appClientId;

/**
 The optional app client secret
 */
@property (nonatomic, readonly, nullable) NSString * appClientSecret;

/**
 The scopes
 */
@property (nonatomic, readonly) NSSet<NSString *> * scopes;

/**
 uri to redirect on sign in.  Must be configured as a uri scheme in your info.plist
 */
@property (nonatomic, readonly) NSString * signInRedirectUri;

/**
 uri to redirect on sign out.  Must be configured as a uri scheme in your info.plist
 */
@property (nonatomic, readonly) NSString * signOutRedirectUri;

/**
 The FQDN of your Cognito endpoint, something like https://mydomain.region.auth.amazoncognito.com
 */
@property (nonatomic, readonly) NSString * webDomain;

/**
 The optional provider name to authenticate with directly instead of presenting the end user with a list of configured providers
 */
@property (nonatomic, readonly, nullable) NSString * identityProvider;

/**
 The optional provider identifier to authenticate with directly instead of presenting the end user with a list of configured providers.  Use this if you want to hide the provider name from the end user.
 */
@property (nonatomic, readonly, nullable) NSString * idpIdentifier;

/**
 The optional user pool id, required if you have enabled advanced security features on your pool.
 */
@property (nonatomic, readonly, nullable) NSString * userPoolId;

/**
 Whether user context information to drive the advanced security feature is emitted.
 */
@property (nonatomic, assign, readonly, getter=isASFEnabled) BOOL asfEnabled;

/**
 If using iOS 11 or above, the SDK will use `SFAuthenticationSession` for signIn and signOut operations if this flag is set. Below iOS 11, the SDK will use SFSafariViewController regardless of this setting.
 */
@property (nonatomic, assign, readonly) BOOL isSFAuthenticationSessionEnabled;


/**
 Configuration object for CognitoAuth
 @param appClientId The app client id
 @param appClientSecret The optional app client secret
 @param scopes Set of scopes to obtain
 @param signInRedirectUri uri to redirect on sign in.  Must be configured as a uri scheme in your info.plist
 @param signOutRedirectUri uri to redirect on sign out.  Must be configured as a uri scheme in your info.plist
 @param webDomain The FQDN of your Cognito endpoint, something like https://mydomain.region.auth.amazoncognito.com
 */
- (instancetype)initWithAppClientId:(NSString *) appClientId
                    appClientSecret:(nullable NSString *) appClientSecret
                             scopes:(NSSet<NSString *> *) scopes
                  signInRedirectUri:(NSString *) signInRedirectUri
                 signOutRedirectUri:(NSString *) signOutRedirectUri
                          webDomain:(NSString *) webDomain;

/**
 Configuration object for CognitoAuth
 @param appClientId The app client id
 @param appClientSecret The optional app client secret
 @param scopes Set of scopes to obtain
 @param signInRedirectUri uri to redirect on sign in.  Must be configured as a uri scheme in your info.plist
 @param signOutRedirectUri uri to redirect on sign out.  Must be configured as a uri scheme in your info.plist
 @param webDomain The FQDN of your Cognito endpoint, something like https://mydomain.region.auth.amazoncognito.com
 @param identityProvider Optional provider name to authenticate with directly
 @param idpIdentifier Optional provider identifier to authenticate with directly
 @param userPoolIdForEnablingASF Optional user pool id for enabling advanced security features
 */
- (instancetype)initWithAppClientId:(NSString *) appClientId
                    appClientSecret:(nullable NSString *) appClientSecret
                             scopes:(NSSet<NSString *> *) scopes
                  signInRedirectUri:(NSString *) signInRedirectUri
                 signOutRedirectUri:(NSString *) signOutRedirectUri
                          webDomain:(NSString *) webDomain
                   identityProvider:(nullable NSString *) identityProvider
                      idpIdentifier:(nullable NSString *) idpIdentifier
           userPoolIdForEnablingASF:(nullable NSString *) userPoolIdForEnablingASF;

/**
 Configuration object for CognitoAuth
 @param appClientId The app client id
 @param appClientSecret The optional app client secret
 @param scopes Set of scopes to obtain
 @param signInRedirectUri uri to redirect on sign in.  Must be configured as a uri scheme in your info.plist
 @param signOutRedirectUri uri to redirect on sign out.  Must be configured as a uri scheme in your info.plist
 @param webDomain The FQDN of your Cognito endpoint, something like https://mydomain.region.auth.amazoncognito.com
 @param identityProvider Optional provider name to authenticate with directly
 @param idpIdentifier Optional provider identifier to authenticate with directly
 @param userPoolIdForEnablingASF Optional user pool id for enabling advanced security features
 @param enableSFAuthSession If true, will use `SFAuthenticationSession` if available. Below iOS 11, the SDK will use SFSafariViewController regardless of this setting
 */
- (instancetype)initWithAppClientId:(NSString *) appClientId
                    appClientSecret:(nullable NSString *) appClientSecret
                             scopes:(NSSet<NSString *> *) scopes
                  signInRedirectUri:(NSString *) signInRedirectUri
                 signOutRedirectUri:(NSString *) signOutRedirectUri
                          webDomain:(NSString *) webDomain
                   identityProvider:(nullable NSString *) identityProvider
                      idpIdentifier:(nullable NSString *) idpIdentifier
           userPoolIdForEnablingASF:(nullable NSString *) userPoolIdForEnablingASF
     enableSFAuthSessionIfAvailable:(BOOL) enableSFAuthSession;

@end


/**
 A User session.  Encapsulates all tokens (id, access and refresh tokens) for a user.
 */
@interface AWSCognitoAuthUserSession : NSObject

/**
 The id token
 **/
@property (nonatomic, readonly, nullable) AWSCognitoAuthUserSessionToken * idToken;

/**
 The access token
 **/
@property (nonatomic, readonly, nullable) AWSCognitoAuthUserSessionToken * accessToken;

/**
 The refresh token
 **/
@property (nonatomic, readonly, nullable) AWSCognitoAuthUserSessionToken * refreshToken;

/**
 Date this session expires
 */
@property (nonatomic, readonly, nullable) NSDate * expirationTime;

/**
 Username for this session
 */
@property (nonatomic, readonly, nullable) NSString * username;

@end

/**
 A JWT session token.
 */
@interface AWSCognitoAuthUserSessionToken : NSObject

/**
 The raw jwt token string
 */
@property (nonatomic, readonly) NSString *  tokenString;

/**
 The claims from the token
 **/
@property (nonatomic, readonly) NSDictionary * claims;

@end


/**
 For obtaining current view controller to interact with the end user
 */
@protocol AWSCognitoAuthDelegate <NSObject>
/**
 Get view controller to display user authentication on top of.
 */
- (UIViewController *) getViewController;

@optional
/**
 If refresh token is expired, let the user decide if the signInVC should be presented or an error should be returned.
 */
- (BOOL) shouldLaunchSignInVCIfRefreshTokenIsExpired;
@end


NS_ASSUME_NONNULL_END

