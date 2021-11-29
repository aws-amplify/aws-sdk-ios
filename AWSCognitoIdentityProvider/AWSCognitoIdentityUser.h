//
// Copyright 2014-2018 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import <Foundation/Foundation.h>
#import "AWSCognitoIdentityProviderService.h"

/**
 The status of the user.
 <ul>
 <li>AWSCognitoIdentityUserStatusUnknown - The user status is unknown.</li>
 <li>AWSCognitoIdentityUserStatusConfirmed - The user was auto confirmed.</li>
 <li>AWSCognitoIdentityUserStatusUnconfirmed - The user was not confirmed.</li>
 </ul>
 */
typedef NS_ENUM(NSInteger, AWSCognitoIdentityUserStatus) {
    AWSCognitoIdentityUserStatusUnknown = 0,
    AWSCognitoIdentityUserStatusConfirmed = -1000,
    AWSCognitoIdentityUserStatusUnconfirmed = -2000,
};

@class AWSCognitoIdentityUserPool;
@class AWSCognitoIdentityUserSession;
@class AWSCognitoIdentityUserSessionToken;
@class AWSCognitoIdentityUserSettings;
@class AWSCognitoIdentityUserMFAOption;
@class AWSCognitoIdentityUserMfaType;
@class AWSCognitoIdentityUserMfaPreferences;

@class AWSCognitoIdentityUserConfirmSignUpResponse;
@class AWSCognitoIdentityUserGetDetailsResponse;
@class AWSCognitoIdentityUserResendConfirmationCodeResponse;
@class AWSCognitoIdentityUserForgotPasswordResponse;
@class AWSCognitoIdentityUserConfirmForgotPasswordResponse;
@class AWSCognitoIdentityUserChangePasswordResponse;
@class AWSCognitoIdentityUserAttributeType;
@class AWSCognitoIdentityUserUpdateAttributesResponse;
@class AWSCognitoIdentityUserDeleteAttributesResponse;
@class AWSCognitoIdentityUserVerifyAttributeResponse;
@class AWSCognitoIdentityUserGetAttributeVerificationCodeResponse;
@class AWSCognitoIdentityUserSetUserSettingsResponse;
@class AWSCognitoIdentityUserGlobalSignOutResponse;
@class AWSCognitoIdentityUserListDevicesResponse;
@class AWSCognitoIdentityUserUpdateDeviceStatusResponse;
@class AWSCognitoIdentityUserGetDeviceResponse;
@class AWSCognitoIdentityUserSetUserMfaPreferenceResponse;
@class AWSCognitoIdentityUserAssociateSoftwareTokenResponse;
@class AWSCognitoIdentityUserVerifySoftwareTokenResponse;

NS_ASSUME_NONNULL_BEGIN

@interface AWSCognitoIdentityUser : NSObject

/**
 The username of this user
 */
@property (nonatomic, readonly, nullable) NSString *username;

/**
 If this user is a result of a signup, this has the confirmation status
 */
@property (nonatomic, readonly) AWSCognitoIdentityUserStatus confirmedStatus;

/**
 Determines whether this user has an active session or not. If the refresh token is expired
 the user will be prompted to authenticate when you call getSession.
*/
@property (nonatomic, readonly, getter=isSignedIn) BOOL signedIn;

/**
 Determines whether this user's session is revocable. If the access token has "origin_jti" claim, then the revocation feature is enabled.
*/
@property (nonatomic, readonly, getter=isSessionRevocable) BOOL sessionRevocable;

/**
 Get the device id
 
 @warning This function is deprecated and will be removed in an upcoming minor
 version of the SDK. You should use deviceIdentifier instead.
 @deprecated Use deviceIdentifier instead.
 */
@property (nonatomic, readonly) NSString * deviceId DEPRECATED_MSG_ATTRIBUTE("Use deviceIdentifier instead.");

/**
 Get the device id
 */
@property (nonatomic, readonly, nullable) NSString * deviceIdentifier;

/**
 Confirm a users' sign up with the confirmation code
 */
- (AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *)confirmSignUp:(NSString *)confirmationCode;


/**
 Confirm a users' sign up with the confirmation code.  If forceAliasCreation is set, if another user is aliased to the same email/phone this code was sent to, reassign alias to this user.
 */
-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode
                                                       forceAliasCreation:(BOOL)forceAliasCreation;

-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode
                                                           clientMetaData:(nullable NSDictionary<NSString *, NSString*> *) clientMetaData;

-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode
                                                       forceAliasCreation:(BOOL)forceAliasCreation
                                                           clientMetaData:(nullable NSDictionary<NSString *, NSString*> *) clientMetaData;
/**
 Resend the confirmation code sent during sign up
 */
- (AWSTask<AWSCognitoIdentityUserResendConfirmationCodeResponse *> *)resendConfirmationCode: (nullable NSDictionary<NSString *, NSString*> *) clientMetaData;

- (AWSTask<AWSCognitoIdentityUserResendConfirmationCodeResponse *> *)resendConfirmationCode;

/**
 Get a session with id, access and refresh tokens.
 */
- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession;

/**
 Get a session with the following username and password
 */
- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession:(NSString *)username
                                                password:(NSString *)password
                                          validationData:(nullable NSArray<AWSCognitoIdentityUserAttributeType *> *)validationData;

- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession:(NSString *)username
                                                password:(NSString *)password
                                          validationData:(nullable NSArray<AWSCognitoIdentityUserAttributeType *> *)validationData
                                          clientMetaData:(nullable NSDictionary<NSString *, NSString*> *) clientMetaData;

- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession:(NSString *)username
                                                password:(NSString *)password
                                          validationData:(nullable NSArray<AWSCognitoIdentityUserAttributeType *> *)validationData
                                isInitialCustomChallenge:(BOOL)isInitialCustomChallenge;

- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession:(NSString *)username
                                                password:(NSString *)password
                                          validationData:(nullable NSArray<AWSCognitoIdentityUserAttributeType *> *)validationData
                                          clientMetaData:(nullable NSDictionary<NSString *, NSString*> *) clientMetaData
                                isInitialCustomChallenge:(BOOL)isInitialCustomChallenge;

/**
 Get details about this user, including user attributes
 */
- (AWSTask<AWSCognitoIdentityUserGetDetailsResponse *> *)getDetails;

/**
 Send a code to this user to initiate the forgot password flow
 */
- (AWSTask<AWSCognitoIdentityUserForgotPasswordResponse *> *)forgotPassword:(nullable NSDictionary<NSString *, NSString*> *) clientMetaData;

- (AWSTask<AWSCognitoIdentityUserForgotPasswordResponse *> *)forgotPassword;


/**
 Conclude the forgot password flow by providing the forgot password code and new password.
 */
- (AWSTask<AWSCognitoIdentityUserConfirmForgotPasswordResponse *> *)confirmForgotPassword:(NSString *)confirmationCode
                                                                                 password:(NSString *)password
                                                                           clientMetaData:(nullable NSDictionary<NSString *, NSString*> *) clientMetaData;


- (AWSTask<AWSCognitoIdentityUserConfirmForgotPasswordResponse *> *)confirmForgotPassword:(NSString *)confirmationCode
                                                                                 password:(NSString *)password;


/**
 Change this user's password
 */
- (AWSTask<AWSCognitoIdentityUserChangePasswordResponse *> *)changePassword:(NSString *)currentPassword
                                                           proposedPassword:(NSString *)proposedPassword;

/**
 Update this user's attributes
 */
- (AWSTask<AWSCognitoIdentityUserUpdateAttributesResponse *> *)updateAttributes:(NSArray<AWSCognitoIdentityUserAttributeType *> *)attributes
                                                                 clientMetaData:(nullable NSDictionary<NSString *, NSString*> *) clientMetaData;

- (AWSTask<AWSCognitoIdentityUserUpdateAttributesResponse *> *)updateAttributes:(NSArray<AWSCognitoIdentityUserAttributeType *> *)attributes;

/**
 Delete the attributes specified by attributeNames
 */
- (AWSTask<AWSCognitoIdentityUserDeleteAttributesResponse *> *)deleteAttributes:(NSArray<NSString *> *)attributeNames;


/**
 Verify a user attribute upon receiving the verification code.
 */
- (AWSTask<AWSCognitoIdentityUserVerifyAttributeResponse *> *)verifyAttribute:(NSString *)attributeName
                                                                         code:(NSString *)code;

/**
 Request a verification code to verify an attribute.
 */
- (AWSTask<AWSCognitoIdentityUserGetAttributeVerificationCodeResponse *> *)getAttributeVerificationCode:(NSString *)attributeName
                                                                                         clientMetaData:(nullable NSDictionary<NSString *, NSString*> *) clientMetaData;

- (AWSTask<AWSCognitoIdentityUserGetAttributeVerificationCodeResponse *> *)getAttributeVerificationCode:(NSString *)attributeName;

/**
 Set the user settings for this user such as MFA
 */
- (AWSTask<AWSCognitoIdentityUserSetUserSettingsResponse *> *)setUserSettings:(AWSCognitoIdentityUserSettings *)settings;


/**
 Set the user mfa preference supercedes SetUserSettings
*/
- (AWSTask<AWSCognitoIdentityUserSetUserMfaPreferenceResponse *> *)setUserMfaPreference:(AWSCognitoIdentityUserMfaPreferences *) preferences;


/**
 Start the process of associating a software token
 */
- (AWSTask<AWSCognitoIdentityUserAssociateSoftwareTokenResponse *> *) associateSoftwareToken;

/**
 Complete the process of associating a software token by verifying the code and setting device friendly name
 */
-(AWSTask<AWSCognitoIdentityUserVerifySoftwareTokenResponse *>*) verifySoftwareToken: (NSString*) userCode friendlyDeviceName: (NSString* _Nullable) friendlyDeviceName;

/**
 Delete this user
 */
- (AWSTask *)deleteUser;

/**
 Remove all sessions from the keychain for this user.  Last known user remains.
 */
- (void)signOut;

/**
 Revoke all tokens for this user. Check Access Token for claims for validity to revoke tokens.
 */
- (AWSTask<AWSCognitoIdentityProviderRevokeTokenResponse *> *) revokeToken;

/**
 Invalidate any active sessions with the service.  Last known user remains.
 */
- (AWSTask<AWSCognitoIdentityUserGlobalSignOutResponse *> *) globalSignOut;

/**
 Remove all sessions from the keychain for this user and clear last known user.
 */
- (void) signOutAndClearLastKnownUser;

/**
 Remove the id and access token from the keychain, but keep the refresh token.
 Use this when you have updated user attributes and want to refresh the id and access tokens.
 */
- (void) clearSession;


/**
 List devices for this user
 */
- (AWSTask<AWSCognitoIdentityUserListDevicesResponse *> *) listDevices: (int) limit paginationToken:(NSString * _Nullable) paginationToken;

/**
 Update device remembered status for a specific device id.
 */
- (AWSTask<AWSCognitoIdentityUserUpdateDeviceStatusResponse *> *) updateDeviceStatus: (NSString *) deviceId remembered:(BOOL) remembered;

/**
 Convenience method to update device remembered status for this device.
 */
- (AWSTask<AWSCognitoIdentityUserUpdateDeviceStatusResponse *> *) updateDeviceStatus: (BOOL) remembered;


/**
 Get device details for a specific deviceId.
 */
- (AWSTask<AWSCognitoIdentityUserGetDeviceResponse *> *) getDevice: (NSString *) deviceId;

/**
 Convenience method to get device details for this device.
 */
- (AWSTask<AWSCognitoIdentityUserGetDeviceResponse *> *) getDevice;


/**
 Forget (stop tracking) a specific deviceId.
 */
- (AWSTask *) forgetDevice: (NSString *) deviceId;

/**
 Forget (stop tracking) this device.
 */
- (AWSTask *) forgetDevice;


@end


/**
 A User session.  Encapsulates all tokens (id, access and refresh tokens) for a user.
 */
@interface AWSCognitoIdentityUserSession : NSObject

@property (nonatomic, readonly) AWSCognitoIdentityUserSessionToken * _Nullable idToken;
@property (nonatomic, readonly) AWSCognitoIdentityUserSessionToken * _Nullable accessToken;
@property (nonatomic, readonly) AWSCognitoIdentityUserSessionToken * _Nullable refreshToken;
@property (nonatomic, readonly) NSDate * _Nullable expirationTime;

@end

/**
 A JWT session token.
 */
@interface AWSCognitoIdentityUserSessionToken : NSObject

/**
 The raw JWT token as a string.
 **/
@property (nonatomic, readonly) NSString *  tokenString;

/**
 A NSDictionary of claims in this token.

 @deprecated This property is incorrectly typed as a [String : String], but
 claim values may be of several different type.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, NSString*> * claims DEPRECATED_MSG_ATTRIBUTE("Use `tokenClaims` instead.");

/**
 A Dictionary of claims in this token
 */
@property (nonatomic, readonly) NSDictionary<NSString *, id> * tokenClaims;

@end

/**
 User settings. Currently only mfa options.
 */
@interface AWSCognitoIdentityUserSettings : NSObject

@property (nonatomic, copy) NSArray<AWSCognitoIdentityUserMFAOption *>* _Nullable mfaOptions;

@end


/**
 User MFA preferences. Replaces user settings for mfa
 */
@interface AWSCognitoIdentityUserMfaPreferences : NSObject

@property (nonatomic, strong) AWSCognitoIdentityUserMfaType* _Nullable smsMfa;
@property (nonatomic, strong) AWSCognitoIdentityUserMfaType* _Nullable softwareTokenMfa;

@end

/**
 User settings. Currently only mfa options.
 */
@interface AWSCognitoIdentityUserMfaType : NSObject

@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, assign) BOOL preferred;

- (instancetype) initWithEnabled:(BOOL) enabled preferred:(BOOL) preferred;

@end


@interface AWSCognitoIdentityUserMFAOption : NSObject

@property (nonatomic, strong) NSString *  attributeName;
@property (nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;

@end

@interface AWSCognitoIdentityUserAttributeType : AWSCognitoIdentityProviderAttributeType
- (instancetype) initWithName:(NSString *) name value:(NSString *) value;
@end

#pragma Response wrappers
@interface AWSCognitoIdentityUserConfirmSignUpResponse : AWSCognitoIdentityProviderConfirmSignUpResponse

@end

@interface AWSCognitoIdentityUserResendConfirmationCodeResponse :AWSCognitoIdentityProviderResendConfirmationCodeResponse

@end

@interface AWSCognitoIdentityUserGetDetailsResponse : AWSCognitoIdentityProviderGetUserResponse

@end

@interface AWSCognitoIdentityUserForgotPasswordResponse : AWSCognitoIdentityProviderForgotPasswordResponse

@end

@interface AWSCognitoIdentityUserConfirmForgotPasswordResponse : AWSCognitoIdentityProviderConfirmForgotPasswordResponse

@end

@interface AWSCognitoIdentityUserChangePasswordResponse : AWSCognitoIdentityProviderChangePasswordResponse

@end

@interface AWSCognitoIdentityUserUpdateAttributesResponse : AWSCognitoIdentityProviderUpdateUserAttributesResponse

@end

@interface AWSCognitoIdentityUserDeleteAttributesResponse : AWSCognitoIdentityProviderDeleteUserAttributesResponse

@end

@interface AWSCognitoIdentityUserVerifyAttributeResponse : AWSCognitoIdentityProviderVerifyUserAttributeResponse

@end

@interface AWSCognitoIdentityUserGetAttributeVerificationCodeResponse : AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse

@end

@interface AWSCognitoIdentityUserSetUserSettingsResponse : AWSCognitoIdentityProviderSetUserSettingsResponse

@end

@interface AWSCognitoIdentityUserGlobalSignOutResponse : AWSCognitoIdentityProviderGlobalSignOutResponse

@end

@interface AWSCognitoIdentityUserListDevicesResponse : AWSCognitoIdentityProviderListDevicesResponse

@end

@interface AWSCognitoIdentityUserUpdateDeviceStatusResponse : AWSCognitoIdentityProviderUpdateDeviceStatusResponse

@end

@interface AWSCognitoIdentityUserGetDeviceResponse : AWSCognitoIdentityProviderGetDeviceResponse

@end

@interface AWSCognitoIdentityUserVerifySoftwareTokenResponse : AWSCognitoIdentityProviderVerifySoftwareTokenResponse

@end

@interface AWSCognitoIdentityUserAssociateSoftwareTokenResponse : AWSCognitoIdentityProviderAssociateSoftwareTokenResponse

@end

@interface AWSCognitoIdentityUserSetUserMfaPreferenceResponse : AWSCognitoIdentityProviderSetUserMFAPreferenceResponse

@end

NS_ASSUME_NONNULL_END
